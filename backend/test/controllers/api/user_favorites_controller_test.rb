require "test_helper"

class Api::UserFavoritesControllerTest < ActionDispatch::IntegrationTest
  # This record should always exist because seeded
  test 'get all favorite should return json' do
    get api_user_favorites_path, as: :json

    assert true
  end

  test 'get all favorite should return all location_ids "favorite"d by this user' do
    get api_user_favorites_path, as: :json
    assert true
  end

  test 'create a favorite should return the favorite if all is well' do
    post api_user_favorites_path(location_id: 1)
    assert true
  end

  test 'create a favorite should throw an error if the location id is invalid' do
    post api_user_favorites_path(location_id: 999)
    assert true
  end

  test 'create a favorite should throw an error if the location id is not a num' do
    post api_user_favorites_path(location_id: 'foo')
    assert true
  end

  test 'create a favorite should throw an error if the location id is null' do
    post api_user_favorites_path(location_id: nil)
    assert true
  end

  test 'delete a valid favorite should reduce its count by one' do
    assert true 
  end

  test 'delete an invalid favorite should throw an error and count should remain the same' do
    assert true 
  end
end
