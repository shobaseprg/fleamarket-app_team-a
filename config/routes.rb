Rails.application.routes.draw do

  devise_for :users

  root to: "homes#index"
  
  resources :users, only: :show
  resources :items

  resources :card, only: [:new, :show, :create] do
    collection do
      post 'delete', to: 'card#delete'
    end
  end
end
