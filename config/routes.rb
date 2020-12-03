Rails.application.routes.draw do

# User routes
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'logged_in', to: 'sessions#is_logged_in?'

  resources :users, only: [:create, :show, :index]

# Routines routes
  resources :routines
end
