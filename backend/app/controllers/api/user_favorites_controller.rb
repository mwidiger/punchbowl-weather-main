class Api::UserFavoritesController < ApplicationController
  def index
    render json: UserFavorite.where(user_id: Identity.current_user_id)
  end

  def create
    render json: []
  end

  def destroy
    render json: nil
  end
end
