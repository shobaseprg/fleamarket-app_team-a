Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"
  
  resources :users, only: :show
  resources :items
  resources :categories, only: [:index, :show] do
    collection do
      get 'get_child_category'
      get 'get_grandchild_category'
    end
  end

  resources :cards, only:[:new, :create]
end
