Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users only: [:show, :edit, :update, :destroy] do
    resources :address_lists [:new, :create, :edit, :update, :destroy]
  end
  resources :items, only: [:index, :show]
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :new, :create]
end
