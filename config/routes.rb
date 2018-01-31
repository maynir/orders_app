Rails.application.routes.draw do
  devise_for :users

  resources :orders
  resources :menu_items
  resources :order_items

  root to: 'menu_items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
