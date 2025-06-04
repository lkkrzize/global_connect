Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events do
    resources :messages, only: [:create]
    resources :event_users, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end


  get '/events/:id/chat', to: 'events#chat', as: :chat

  resources :profiles, only: [:show, :edit, :update]
end
