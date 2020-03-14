Rails.application.routes.draw do

  root to: "homes#index"

  devise_for :users
  resources :items
  resources :categories, only: [:index]
end
