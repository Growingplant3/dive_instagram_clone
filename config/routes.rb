Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    post :confirm, on: :collection
  end
  resources :favorites, only: %i[create destroy index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users#new"
end
