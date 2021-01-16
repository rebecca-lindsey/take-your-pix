Rails.application.routes.draw do
  resources :photographers
  resources :albums do
    resources :photos, only: %i[show new edit create update destroy]
  end
  resources :clients
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
