class Factories::UserFavoriteFactory

  def self.create(location_id: nil, user_id: nil)
    user_favorite = UserFavorite.create(
      location_id: location_id, 
      user_id: user_id
    )
    
    return user_favorite.valid? ? user_favorite : nil 
  end

  def self.delete?(location_id: nil)
    # TODO: Refactor front end to pass in actual user favorite record
    # ID so this call to db isn't necessary
    user_favorite = UserFavorite.where(
      user_id: Identity.current_user_id, 
      location_id: location_id).first 
    
    return false unless user_favorite

    UserFavorite.delete(user_favorite.id) == 1
  end
end