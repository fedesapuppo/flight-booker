Rails.application.routes.draw do
  root "flights#index"
  get "/flights/index", to: "flights#index"
  resources :flights, only: [:index, :show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
