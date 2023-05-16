Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/authors", to: "authors#index"
  get "/authors/new", to: "authors#new"
  post "/authors", to: "authors#create"
  get "/authors/:id", to: "authors#show"
  get "authors/:id/edit", to: "authors#edit"
  patch "authors/:id", to: "authors#update"
  delete "authors/:id", to: "authors#destroy"
  
  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  get "/books/:id/edit", to: "books#edit"
  patch "/books/:id", to: "books#update"
  
  get "authors/:author_id/books", to: "authors/books#index"
  get "authors/:author_id/books/new", to: "authors/books#new"
  post "/authors/:author_id/books", to: "authors/books#create"
end
