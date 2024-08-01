class UserFavorite < ApplicationRecord
  # belongs_to :user
  validates_presence_of :user_id
  validates :user_id, uniqueness: { 
    scope: :location_id,
    message: "already exists for this user and location" 
  }
  belongs_to :location
end
