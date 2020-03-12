Rails.application.routes.draw do

  root to: "homes#index"
  
  resources :users, only: :show

  devise_for :users

end
