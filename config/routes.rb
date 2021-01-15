Rails.application.routes.draw do
  resources :photographers
  resources :albums
  resources :clients
  resources :photos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
