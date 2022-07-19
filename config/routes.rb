Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :carts
  resources :users

  resources :cart_items
  
  root to: 'pages#home'

  get 'shop', to: 'pages#shop'
  get 'products/:id/view', to: 'pages#view_product'

  post '/cart/add_item', to: 'carts#add_item'
  
  get '/cart', to: 'carts#show_cart'

  put '/cart/:id/update_status', to: 'carts#update_status'

end