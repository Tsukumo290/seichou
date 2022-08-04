Rails.application.routes.draw do
  devise_for :users
  root to: "records#home"
  resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:edit, :update]
end
