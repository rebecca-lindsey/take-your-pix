Rails.application.routes.draw do
  resources :photographers
  resources :albums do
    resources :photos, only: %i[show new edit create update destroy]
  end
  resources :clients
  resources :welcome, only: :create, path: '/'
  get '/' => 'welcome#index', as: 'root'
  # post '/' => 'welcome#index', as: 'root'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end
