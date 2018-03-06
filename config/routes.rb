Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show]
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :new, :create]
  end
end
