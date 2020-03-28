Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"
  
  resources :users, only: :show
  resources :items
  resources :categories,only: :index

  resources :cards, only:[:new, :create]
end
