Rails.application.routes.draw do

  devise_for :users
  root "users#index"
  resources :accounts
  resources :transactions, only: [:new, :create, :index]
  get 'users/show'
  get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
