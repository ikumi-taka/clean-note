Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :users, only: [:edit, :update]
  resources :houseworks, only: [:new, :create]
end
