Rails.application.routes.draw do
  root to: "records#home"
  resources :records, only: [:index]
end
