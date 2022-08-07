Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "records#home"
  resources :records

  get 'eight', to: 'records#eight'
  get 'nine', to: 'records#nine'
end
