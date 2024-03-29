Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "products#index"

  resources :products do
    resources :orders, controller: 'orders'
  end
  resources :payments, only:[:pay_item]
end