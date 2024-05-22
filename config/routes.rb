Rails.application.routes.draw do
  resources :abouts
  resources :stores
  resources :payrolls
  resources :employees
  resources :administrators, except: [:destroy]
  resources :payments, only: %i[new create]


  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'users/table', to: 'users/registrations#table', as: 'user_table'
  end

  resources :products do
    post 'comprar', on: :member
    collection do
      get 'search'
      get 'table'
    end
  end

  resources :purchases do
    patch 'close', on: :member
    collection do
      get 'user_last_purchase'
    end
  end

  resources :departments do
    collection do
      get 'table'
    end
  end

  resources :categories do
    collection do
      get 'table'
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  delete '/item_purchases/:id', to: 'item_purchases#destroy', as: 'item_purchase'

  resources :item_purchases do
    member do
      post 'growth'
      post 'reduction'
    end
  end

  root 'products#index'

end
