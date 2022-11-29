Rails.application.routes.draw do
  get 'records/index'
  root to: "records#index"
end
