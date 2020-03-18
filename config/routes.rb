Rails.application.routes.draw do


  root to: "homes#index"

  devise_for :users

  resources :users, only: :show

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :items

end
