class User < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :tagline, :description, :name, :latitude, :longitude

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.image = auth.info.image
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.geocode(user)
    coords = Location.geocode(user)
      user.update_attribute(:latitude, coords[0])
      user.update_attribute(:longitude, coords[1])
  end
end