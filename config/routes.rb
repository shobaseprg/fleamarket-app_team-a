Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  root to: "items#index"

  resources :users, only: :show do
    collection do
      get 'sale_saling_items'
      get 'sale_soldout_items'
      get 'sale_all_saling_items'
      get 'sale_all_soldout_items'

      get 'buy_trading_items'
      get 'buy_buyed_items'
      get 'buy_all_trading_items'
      get 'buy_all_buyed_items'
    end
  end
  
  resources :addresses,only: [:index,:new,:create,:edit,:update,:destroy]

  resources :items do
    resources 'purchase' ,only: [:index]
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end


    member do
      get  'list_from_category'
    end
  end

  resources :comments, only:[:create,:update,:destroy] do
    member do
      get 'restore'
    end
  end


  resources :categories, only: [:index] 

  resources :brands, only: [:index,:show] 

  resources :cards, only:[:index, :new, :create,:destroy,:show] do
    member do
      post 'pay'
    end
  end

end

