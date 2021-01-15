Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :photographers
  resources :albums
  resources :clients
  resources :photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
