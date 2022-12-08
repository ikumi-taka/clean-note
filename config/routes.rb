Rails.application.routes.draw do
  devise_for :users
  get 'houseworks', to: 'houseworks#index'
  root to: 'houseworks#index'
  resources :users, only: [:edit, :update]
  resources :houseworks, only: [:new, :create, :destroy] do
    resources :records, only: [:index, :create]
  end

end
