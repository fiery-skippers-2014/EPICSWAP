class User < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :tagline, :description, :name, :image, :email, :latitude, :longitude, :reputation
  has_many :skills, through: :user_skills
  has_many :user_skills
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :reputations
  validates_presence_of :name, :email

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.image = auth.info.image
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
        if (:provider == :facebook)
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       end
      user.save!
    end
  end

  def self.geocode(user)
    coords = Location.geocode(user)
      user.update_attribute(:latitude, coords[0])
      user.update_attribute(:longitude, coords[1])
  end

  def distance(user)
    Geocoder::Calculations.distance_between([self.latitude, self.longitude],[user.latitude, user.longitude])
  end

  def less_than_max?
    UserSkill.less_than_max?(self)
  end

  def self.all_with_skills
    skilled_users = User.find_users_with_skills
    p '$' * 50
    p skilled_users
    skilled_users.map { |user| user.with_skills }
  end

  def self.find_users_with_skills
    users_with_skills = []
    User.all.each do |user|
      users_with_skills << user if user.skills.length > 0
    end
    return users_with_skills.uniq
  end

  def with_skills
    { user: self, skills: self.skills.map(&:name), category: self.skills.sample(1).first.category.name }
  end
end