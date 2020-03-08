Rails.application.routes.draw do

  get 'comment/payment'
  root to: "homes#index"

  devise_for :users

end
