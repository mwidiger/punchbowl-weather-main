class UserFavorite < ApplicationRecord
  # belongs_to :user
  validates_presence_of :user_id
  belongs_to :location
end
