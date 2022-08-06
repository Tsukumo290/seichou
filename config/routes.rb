Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "records#home"
  resources :records do
    collection do
      get 'search'
    end
  end
  get 'album', to: 'records#album'

  get 'eight', to: 'records#eight'
  get 'nine', to: 'records#nine'
end
