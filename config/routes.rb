Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: %i[new create destroy]
  resources :pictures
  root to: "users#new"
end
