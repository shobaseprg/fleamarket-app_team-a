Rails.application.routes.draw do

  root to: "items#index"
  
  resources :users, only: :show
  resources :items

end
