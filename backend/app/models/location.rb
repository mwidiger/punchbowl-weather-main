class Location < Struct.new(:name, :lat, :lon)
  LOCATIONS = HashWithIndifferentAccess.new({
    new_york: self.new('New York, New York', 40.7128, -74.0060),
    boston: self.new('Boston, Massachusetts', 42.3601, -71.0589),
    chicago: self.new('Chicago, Illinois', 41.8781, -87.6298),
    denver: self.new('Denver, Colorado', 39.7392, -104.9903),
    houston: self.new('Houston, Texas', 29.7604, -95.3698),
    seattle: self.new('Seattle, Washington', 47.6062, -122.3321),
    los_angeles: self.new('Los Angeles, California', 34.0522, -118.2437)
  })

  def self.get(slug)
    LOCATIONS[slug]
  end

  def self.lookup(lat:, lon:)
    city = Geocoder.search([lat, lon]).first.city
    self.new(city, lat, lon)
  rescue
    nil
  end
end
