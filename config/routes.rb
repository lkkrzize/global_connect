Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :events do
    # resources :messages, only: []
    resources :event_users, only: [:create, :destroy]
    # resources :reviews, only: []
  end
end
