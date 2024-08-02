# Since we are worrying about performance and overloading of our API,
# might as well do the whole thing:

# 1. No throttle or block for development/test environments
Rack::Attack.enabled = ENV['ENABLE_RACK_ATTACK'] || Rails.env.production?

# 2. Only allow requests from our apps IP addresses. 
# Accepts comma-delimited list of IPs that are allowed.  Configurable
# with environment variable (but unfortunately will require re-deploy
# if this needs to be changed because we are working in middleware)
FRONT_END_IP_ADDRESSES = ENV['FRONT_END_IP_ADDRESSES'].split(",").to_set rescue Set.new

# Block anything not identified as an app front-end
Rack::Attack.blocklist('allow only frontend') do |req|
  !FRONT_END_IP_ADDRESSES.include?(req.ip)
end

# 3. Assuming we are getting hits from the front end, rate-limit
# the requests to deal with users who are spamming our app.  Rate
# limits are defined by (number of requests allowed / time period)
# Defaults to 5 requests per 30 seconds
RATE_LIMIT_REQUEST_COUNT = ENV['RATE_LIMIT_REQUEST_COUNT'] || 5
RATE_LIMIT_TIME_PERIOD = ENV['RATE_LIMIT_TIME_PERIOD'] || 30

# Two possibilities: Logged in user and not.  Logged in user, we
# should throttle based on the email that was sent.  It is possible
# that someone could create a DDOS by spamming the login with 
# varying emails.  So we have a:
# TODO: Either create throttle on the front end to handle spam
#       from user using varying emails, or pass IP address of 
#       user logging in to back end and throttle here using that

# Throttle for logins
Rack::Attack.throttle(
  'limit logins per email', 
  limit: RATE_LIMIT_REQUEST_COUNT, 
  period: RATE_LIMIT_TIME_PERIOD) do |req|
  
  if req.path == '/login' && req.post?
    req.params['email'].to_s.downcase.gsub(/\s+/, "")
  end
end

# Throttle for everything else by logged-in user
Rack::Attack.throttle('limit for logged in user', 
  limit: RATE_LIMIT_REQUEST_COUNT, 
  period: RATE_LIMIT_TIME_PERIOD.seconds) do |req|
  
    # If this is nil, the throttle won't do anything, so is ok for 
  # non-logged-in users
  Identity.current_user_id
end

# TODO: Utilize Redis for caching
# Rack::Attack.cache.store = Redis.new(url: ENV['REDIS_FOR_RACK_ATTACK_URL']) if ENV['REDIS_FOR_RACK_ATTACK_URL']
