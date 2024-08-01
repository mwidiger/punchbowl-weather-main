class Location < ApplicationRecord
  has_many :user_favorites, dependent: :delete_all

  def self.get(slug)
    where(slug: slug).first
  end

  def self.lookup(lat:, lon:)
    city = Geocoder.search([lat, lon]).first.city
    self.new(slug: nil, name: city, latitude: lat, longitude: lon)
  rescue
    nil
  end
end
