Rails.application.routes.draw do
  devise_for :users
  # get 'houseworks', to: 'houseworks#index'
  root to: 'houseworks#index'
  resources :users, only: [:edit, :update]
  resources :houseworks, only: [:new, :create, :destroy] do
    resources :records, only: [:index, :create]
      # resources :likes, only: [:create, :destroy]
  end
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
