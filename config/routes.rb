Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # resources :events do

  resources :events do
    # resources :messages, only: []
    # resources :event_users, only: []
    # resources :reviews, only: []
  end
end
