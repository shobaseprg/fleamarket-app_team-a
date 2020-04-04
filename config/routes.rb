Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"

  resources :users, only: :show
  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:index] 

  resources :cards, only:[:index, :new, :create,:destroy]
end
