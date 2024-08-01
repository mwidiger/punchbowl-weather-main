require "test_helper"

class Api::LocationControllerTest < ActionDispatch::IntegrationTest
  # This record should always exist because seeded
  id = Location.first.id

  test 'get all locations returns json' do
    get api_locations_path, as: :json
    assert_response :success
    assert response.parsed_body.first['id'] == id
  end

  test 'get a location returns json' do
    id = Location.first.id
    get api_location_path(id), as: :json
    assert_response :success
    assert response.parsed_body['id'] == id
  end
end
