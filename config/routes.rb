Rails.application.routes.draw do
  resources :products
  resources :carts
  resources :users
  root to: 'pages#home'

  get 'shop', to: 'pages#shop'
end
