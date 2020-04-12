Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"

  resources :users, only: :show

  resources :items do
    resources 'purchase' ,only: [:index]
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
<<<<<<< Updated upstream
    resources 'purchase' ,only: [:index]
=======
    member do
     get  'list_from_category'
    end
>>>>>>> Stashed changes
  end

  resources :categories, only: [:index] 

  resources :cards, only:[:new, :create]
end
