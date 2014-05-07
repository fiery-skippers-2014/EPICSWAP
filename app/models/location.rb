class Location < ActiveRecord::Base
  geocoded_by :address

  def self.geocode(user)
    Geocoder.coordinates("#{user.street}, #{user.city} #{user.state}")
  end
end
