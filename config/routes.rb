Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :messages, only: [:create]
    resources :event_users, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  get '/search', to: 'events#search'
  get '/events/:id/chat', to: 'events#chat', as: :chat

  resources :profiles, only: [:show]
end
