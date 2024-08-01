class Api::LocationsController < ApplicationController
  def index
    render json: Location.all
  end

  def show
    render json: Location.where(id: params[:id]).first
  end
end
