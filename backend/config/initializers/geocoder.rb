login = begin
  Etc.getlogin
rescue # rubocop:disable Style/RescueStandardError
  'unknown'
end

Geocoder.configure(
  http_headers: { 'User-Agent' => "punchbowl_weather_#{login}" }
)
