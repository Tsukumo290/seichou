Rails.application.routes.draw do
  devise_for :users
  root to: "records#home"
  resources :records
  resources :users, only: [:edit, :update]
  get 'eight', to: 'records#eight'
  get 'nine', to: 'records#nine'
end
