Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :shoppings
  resources :e_stores
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home'
  devise_for :users
  resources :bookings

  Rails.application.routes.draw do
    resources :orders, only: [:create, :show, :destroy]
  end

  get 'cart_item_count', to: 'carts#item_count'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Route for "/aboutus"
  get '/aboutus', to: 'pages#aboutus'
  get '/home', to: 'pages#home'

  # Defines the root path route ("/")
  # root "articles#index"
end
