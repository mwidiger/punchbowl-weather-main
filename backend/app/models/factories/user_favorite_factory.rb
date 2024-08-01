class Factories::UserFavoriteFactory

  def self.create(location_id: nil, user_id: nil)
    user_favorite = UserFavorite.create(
      location_id: location_id, 
      user_id: user_id
    )
    
    return user_favorite.valid? ? user_favorite : nil 
  end

  def self.delete?(id: nil)
    UserFavorite.delete(id) == 1
  end
end