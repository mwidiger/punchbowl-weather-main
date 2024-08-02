class Middleware::RackAttackTest < ActionDispatch::IntegrationTest
  # This needs solid testing, but after exhausting myself figuring out
  # how to configure rack-attack, I've just put a commented idea
  # for how to proceed

  # TODO: Verify this code works and tests rack_attack configuration
  #       correctly.

  test 'rate_limiting' do
    # Enable Rack::Attack for these tests
    #Rack::Attack.enabled = true
    #Rack::Attack.reset!

    #RATE_LIMIT_REQUEST_COUNT.times do 
    #  get api_locations_path, as: :json
    #end
    
    #now one more to trigger the limit
    #get api_locations_path, as: :json

    #assert_response :internal_server_error

    # disable Rack::Attack so the rest of the tests don't fail
    #Rack::Attack.enabled = false
    #Rack::Attack.reset!
  end
end
