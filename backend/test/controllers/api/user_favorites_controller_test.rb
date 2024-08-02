require "test_helper"

class Api::UserFavoritesControllerTest < ActionDispatch::IntegrationTest
  user_id = Identity.current_user_id
  location_id = Location.first.id
  uf = UserFavorite.where(user_id: user_id, location_id: location_id).first_or_create

  # This record should always exist because seeded
  test 'get all favorite should return json' do
    get api_user_favorites_path, as: :json
    assert_response :success
  end

  test 'get all favorite should return all location_ids "favorite"d by this user' do
    get api_user_favorites_path, as: :json
    assert response.parsed_body.length == 1
  end

  test 'create a favorite should return the new favorite if all is well' do
    new_location_id = location_id + 1
    post api_user_favorites_path(location_id: new_location_id)
    assert_response :created
    assert response.parsed_body['location_id'] == new_location_id
  end

  test 'create a favorite should throw an error if the location id is invalid' do
    post api_user_favorites_path(location_id: 999)
    assert_response :bad_request
  end

  test 'create a favorite should throw an error if the location id is not a num' do
    post api_user_favorites_path(location_id: 'foo')
    assert_response :bad_request
  end

  test 'create a favorite should throw an error if the location id is null' do
    post api_user_favorites_path(location_id: nil)
    assert_response :bad_request
  end

  test 'delete a valid favorite should reduce its count by one' do
    delete api_user_favorite_path(id: uf.id)
    assert_response :no_content
    assert UserFavorite.count == 0
  end

  test 'delete an invalid favorite should throw an error and count should remain the same' do
    delete api_user_favorite_path(id: 999)
    assert_response :bad_request
  end
end
