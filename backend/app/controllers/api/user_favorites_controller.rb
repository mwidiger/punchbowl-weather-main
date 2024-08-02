class Api::UserFavoritesController < ApplicationController
  def index
    render json: UserFavorite.where(user_id: Identity.current_user_id)
  end

  def create
    user_favorite = Factories::UserFavoriteFactory.create(
      location_id: params[:location_id],
      user_id: Identity.current_user_id
    )

    if user_favorite
      render json: user_favorite, status: :created
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    render json: {}, status: Factories::UserFavoriteFactory.delete?(location_id: params[:id]) ? :no_content : :bad_request
  end
end
