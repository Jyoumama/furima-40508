Rails.application.routes.draw do
  devise_for:users
  root to: 'items#index'
  #get 'items',to:'items#index'
  resources :items, only: [:index, :new, :create, :show ]
  #resources :users
  resources :users, except: [:index]
end
