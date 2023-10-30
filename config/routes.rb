Rails.application.routes.draw do
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
