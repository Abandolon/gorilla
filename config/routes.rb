Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end

    # root to: 'pages#home'
  resources :gyms, only: [:index] do
    resources :users, only: [:index]
  end
  resources :veterans, only: [:index]
  resources :users, only: [:show] do
    resources :styles, only: [:show]
    resources :bookings, only: [:new, :create]
  end
  resources :styles, only: [:index]
  get '/dashboard', to: 'dashboard#show'
  get '/dashboard/bookings', to: 'bookings#index'
  get '/dashboard/chat_rooms', to: 'chat_rooms#index'
  resources :gifts, only: [:index, :new, :create]
  resources :users, only: :update, as: :gift_update

  resources :bookings, only: [:update, :destroy] do
    resources :chat_rooms, only: [:new, :create]
  end

  resources :chat_rooms, only: :show do
      resources :messages, only: :create
    end

  get '/show_starter/:id', to: 'users#show_starter', as: :starter

  mount ActionCable.server => "/cable"
end

