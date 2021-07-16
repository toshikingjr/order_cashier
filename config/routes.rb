Rails.application.routes.draw do
  devise_for :users
  root 'menus#index'
  resources :tables, only: [:index, :new, :create, :show] do
    resources :menus 
    resources :orders, only: [:new, :create]
    get '/my_order' => 'orders#my_order'
    post '/add_menu' => 'orders#add_menu'
    post '/update_menu' => 'orders#update_menu'
    delete '/delete_menu' => 'orders#delete_menu'
    resources :order_confirms, only: [:create, :destroy]
  end
end
