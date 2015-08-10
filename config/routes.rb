Rails.application.routes.draw do

  root "questions#index"

  get "/signup", to: "users#new"

  get '/login', to: "sessions#new"

  post '/login', to: "sessions#create"

  get '/logout', to: "sessions#destroy"

  resources :questions

  resources :answers

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

end
