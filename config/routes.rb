Rails.application.routes.draw do
  devise_for:users
  root to: 'items#index'
  resources :items
  resources :users, except: [:index]
  #resources :orders
end
