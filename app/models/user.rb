class User < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :tagline, :description, :name, :image, :email, :latitude, :longitude, :reputation
  has_many :skills
  has_many :interests
  has_many :reputations
  validates_presence_of :name, :email

  # after_save :set_reputation

  # def self.set_reputation
  #   self.reputations.update_attribute(score: score +=1 )
  # end

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
end