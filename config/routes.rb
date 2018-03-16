Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get '/items/detail_search', to: 'items#detail_search', as: 'detail_search_items'
  get '/items/detail_search_result', to: 'items#detail_search_result', as: 'detail_search_result_items'
  resources :items, only: [:index, :show] do
    resources :favorite_item, only: [:create, :destroy] do
      collection do
        get 'search'
        get 'searchResult'
      end
    end
  end
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :new, :create]
end
