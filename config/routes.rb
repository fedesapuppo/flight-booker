Rails.application.routes.draw do
  root "flights#index"

  devise_for :users

  resources :flights, only: [:index, :show]
  resources :bookings, only: [:new, :create, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
