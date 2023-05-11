Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/authors", to: "authors#index"
  get "/authors/:id", to: "authors#show"
  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  get "authors/:author_id/books", to: "authors/books#index"
end
