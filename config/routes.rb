Rails.application.routes.draw do

  devise_for :users

  root to: "homes#index"
  
  resources :users, only: :show
  resources :items

  resources :products do only: [:index, :new, :update, :create] do
    collection do
      post 'purchase'
    end
  end

end
