Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "records#home"
  resources :records
  get 'tag', to: 'records#tag'

  resources :incomes
  get 'top', to: 'incomes#top'
  resources :fixedcosts
end
