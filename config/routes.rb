Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "items#index"

  resources :users, only: :show

  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    member do
     get  'list_from_category'
    end
    resources 'purchase' ,only: [:index]
  end

  resources :categories, only: [:index] 

  resources :cards, only:[:index, :new, :create,:destroy]

end

