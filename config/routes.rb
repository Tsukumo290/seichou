Rails.application.routes.draw do
  devise_for :users
  root to: "records#home"
  resources :records
  resources :users, only: [:edit, :update]
end
