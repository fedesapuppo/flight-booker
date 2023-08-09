Rails.application.routes.draw do
  get "bookings/new"
  root "flights#index"
  get "/flights/index", to: "flights#index"
  resources :flights, only: [:index, :show]
  devise_for :users
  get "bookings/new", to: "bookings#new", as: :new_booking
  resources :bookings, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
