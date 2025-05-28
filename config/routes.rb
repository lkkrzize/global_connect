Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

<<<<<<< HEAD
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :events, only: %i[edit update] do
=======
  resources :events, only: [] do
>>>>>>> master
    # resources :messages, only: []
    # resources :event_users, only: []
    # resources :reviews, only: []
  end
end
