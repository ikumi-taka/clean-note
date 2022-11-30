Rails.application.routes.draw do
  devise_for :users
  #get 'records/index'
  root to: "records#index"
  resources :users, only: [:edit, :update]
end
