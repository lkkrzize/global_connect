Rails.application.routes.draw do
  get 'events/show'
  devise_for :users
  root to: "pages#home"

  resources :events, only: [] do
    # resources :messages, only: []
    # resources :event_users, only: []
    # resources :reviews, only: []
  end
end
