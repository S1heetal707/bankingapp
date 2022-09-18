# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :users
    end
  end

  # devise_for :users
  # root 'users#index'
  resources :transactions
  # get 'users/show'
  # get 'users/edit'
  resources :accounts
end
