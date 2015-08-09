Rails.application.routes.draw do

  get "/signup", to: "users#new"

  resources :questions

  resources :answers

  resources :users, only: [:new, :create, :show]

end
