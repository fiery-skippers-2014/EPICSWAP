class Location < ActiveRecord::Base
  geocoded_by :address

  def self.geocode(user)
    address = "#{user.street}, #{user.city} #{user.state}"
    coords = Geocoder.coordinates(address)
  end
end