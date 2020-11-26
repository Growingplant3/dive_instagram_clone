Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    post :confirm, on: :collection
  end
  recources :favorites, only: %i[create destroy]
  root to: "users#new"
end
