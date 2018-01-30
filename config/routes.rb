Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  resources :orders
  devise_for :users
  resources :menu_items
  root to: 'menu_items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
