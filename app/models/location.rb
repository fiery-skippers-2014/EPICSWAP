class Location < ActiveRecord::Base
  geocoded_by :address

  def self.geocode(user)
    address = "#{user.street}, #{user.city} #{user.state}, #{user.zip}"
    coords = Geocoder.coordinates(address)
  end
end