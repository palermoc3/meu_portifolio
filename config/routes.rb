Rails.application.routes.draw do
  resources :abouts
  resources :stores
  resources :item_purchases
  resources :purchases
  resources :payrolls
  resources :employees
  resources :administrators
  devise_for :users
  resources :products do
    post 'comprar', on: :member
    collection do
      get 'search'
      get 'table'
    end
  end
  resources :categories
  resources :departments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "departments#index"
end
