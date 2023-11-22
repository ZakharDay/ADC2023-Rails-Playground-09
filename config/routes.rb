Rails.application.routes.draw do
  resources :posts

  namespace :api do
    namespace :v1 do
      resources :pins
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

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/feed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
