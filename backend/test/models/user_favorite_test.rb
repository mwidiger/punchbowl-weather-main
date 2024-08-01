require "test_helper"

class UserFavoriteTest < ActiveSupport::TestCase
  location_id = Location.first.id
  
  test "can initialize favorite" do
    favorite = UserFavorite.create(user_id: 1, location_id: location_id)
    assert_instance_of UserFavorite, favorite
    assert_equal 1, favorite.user_id
    assert_equal location_id, favorite.location_id
  end

  test "cannot save favorite with invalid location" do
    assert !UserFavorite.create(user_id: 1, location_id: 999).valid?
  end

  test "cannot save favorite with missing location" do
    assert !UserFavorite.create(user_id: 1).valid?
  end

  test "cannot save favorite with missing user" do
    assert !UserFavorite.create(location_id: location_id).valid?
  end
end
