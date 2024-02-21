Rails.application.routes.draw do
  require 'resque/server'
  mount Resque::Server, at: '/jobs'

  patch 'invites/:id', to: 'invites#update', as: 'invite'

  get 'cart/add/:id', to: 'carts#add', as: 'cart_add'
  resources :products

  post 'support/request_support'

  resources :profiles
  resources :profile_pictures

  resources :pins do
    resources :comments, only: [:create, :edit, :update]

    collection do
      get "by_tag/:tag", to: "pins#by_tag", as: "tagged"
      get "by_category/:category", to: "pins#by_category", as: "categorized"
    end
  end

  resources :poly_comments, only: [:create]

  resources :posts

  namespace :api do
    namespace :v1 do
      resources :pins

      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "sessions#destroy"
      end
    end
  end

  namespace :admin do
    resources :pins do
      resources :comments
    end

    resources :comments
    resources :subscriptions

    root to: "admin/pins#index"
  end

  resources :subscriptions, only: [:create, :show]

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/feed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
