class Location < ApplicationRecord
  def self.get(slug)
    first(slug: slug)
  end

  def self.lookup(lat:, lon:)
    city = Geocoder.search([lat, lon]).first.city
    self.new(slug: nil, name: city, latitude: lat, longitude: lon)
  rescue
    nil
  end
end
