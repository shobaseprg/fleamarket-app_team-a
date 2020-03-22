Rails.application.routes.draw do

  root to: "homes#index"
  
  resources :users, only: :show
  resources :items
  resources :categories,only: :index

end
