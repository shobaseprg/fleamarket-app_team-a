Rails.application.routes.draw do

  devise_for :users

  root to: "homes#index"
  
  resources :users, only: :show
  resources :items

  resources :cards, only:[:new, :create]
end
