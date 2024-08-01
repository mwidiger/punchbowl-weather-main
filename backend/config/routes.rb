Rails.application.routes.draw do
  namespace :api do
    resources :user_favorites, only: [:index, :create, :destroy]
    resources :locations, only: [:index, :show] do
      resource :weather, only: [:show]
    end
  end
end
