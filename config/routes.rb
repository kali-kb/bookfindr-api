Rails.application.routes.draw do
  resources :saved_books 
  resources :books, only: [:index]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/books/search", to: "books#search", as: "search_books"
  post "/signin", to: "sessions#create", as: "log_in"
  delete "/user/saved_books", to: "saved_books#destroy_all"
  # Defines the root path route ("/")
  # root "posts#index"
end
