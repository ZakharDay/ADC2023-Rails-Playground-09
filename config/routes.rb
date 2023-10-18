Rails.application.routes.draw do
  resources :subscriptions
  devise_for :users
  resources :pins do
    resources :comments
  end

  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
