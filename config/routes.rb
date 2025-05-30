Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    # resources :messages, only: []
    resources :event_users, only: [:create, :destroy]
    # resources :reviews, only: []
  end
  
  get '/search', to: 'events#search'
end
