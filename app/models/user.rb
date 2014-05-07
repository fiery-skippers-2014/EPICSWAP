class User < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :tagline, :description, :name, :image, :email, :latitude, :longitude, :reputation
  has_many :skills, through: :user_skills
  has_many :user_skills, dependent: :destroy
  has_many :user_interests, dependent: :destroy
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

  def interested_in? interest
    self.interests.include? interest
  end

  def update_long_and_lat data
    if self.latitude.blank? && self.longitude.blank?
      self.update_attributes :latitude => data['latitude'], :longitude =>  data['longitude']
    end
  end

  def distance(user)
    Geocoder::Calculations.distance_between([self.latitude, self.longitude],[user.latitude, user.longitude])
  end

  def less_than_max?
    UserSkill.less_than_max?(self)
  end

  def missing_address?
    self.street.nil?
  end

  def self.all_with_skills
    skilled_users = User.find_users_with_skills
    skilled_users.map { |user| user.with_skills }
  end

  # REVIEW:
  def self.find_users_with_skills
    users_with_skills = []
    self.all.each do |user|
      users_with_skills << user if user.skills.length > 0
    end
    return users_with_skills.uniq
  end

  def with_skills
    { user: self, skills: self.skills.map(&:name), category: self.skills.sample(1).first.category.name }
  end
end
