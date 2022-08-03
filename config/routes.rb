Rails.application.routes.draw do
  devise_for :users
  root to: "records#home"
  resources :records, only: [:index, :new, :create]
end
