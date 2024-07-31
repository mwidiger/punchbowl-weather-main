LOCATIONS = [
  { 
    slug: 'new_york', 
    name: 'New York, New York', 
    latitude: 40.7128, 
    longitude: -74.0060
  },
  {
    slug: 'boston',
    name: 'Boston, Massachusetts',
    latitude: 42.3601,
    longitude: -71.0589,
  },
  { slug: 'chicago',
    name: 'Chicago, Illinois', 
    latitude: 41.8781, 
    longitude: -87.6298
  },
  {
    slug: 'denver',
    name: 'Denver, Colorado',
    latitude: 39.7392,
    longitude: -104.9903
  },
  {
    slug: 'houston',
    name: 'Houston, Texas',
    latitude: 29.7604,
    longitude: -95.3698
  },
  {
    slug: 'seattle',
    name: 'Seattle, Washington',
    latitude: 47.6062,
    longitude: -122.3321
  },
  {
    slug: 'los_angeles',
    name: 'Los Angeles, California',
    latitude: 34.0522,
    longitude: -118.2437
  }
]

LOCATIONS.each do |location_data| 
  Location.create(location_data) unless Location.where(slug: location_data[:slug]).any?
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
