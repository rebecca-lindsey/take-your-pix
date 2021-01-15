Rails.application.routes.draw do
  resources :photographers
  resources :albums
  resources :clients
  resources :photos
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
