Rails.application.routes.draw do
  root 'menus#index'
  resources :menus 
  resources :orders, only: [:new, :create]
  get '/my_order' => 'orders#my_order'
  post '/add_menu' => 'orders#add_menu'
  post '/update_menu' => 'orders#update_menu'
  delete '/delete_menu' => 'orders#delete_menu'
end
