Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "records#home"
  resources :records
  get 'tag', to: 'records#tag'

  resources :incomes
  get 'top', to: 'incomes#top'
  post "income_values/new(/:name)" => "income_values#new"
  resources :fixedcosts
  resources :variablecosts
  resources :income_values
end
