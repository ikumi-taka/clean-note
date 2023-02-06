Rails.application.routes.draw do
  devise_for :users
  root to: 'houseworks#index'
  resources :users, only: [:edit, :update]
  resources :houseworks, only: [:new, :create, :destroy] do
    resources :records, only: [:index, :create]
  end
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
