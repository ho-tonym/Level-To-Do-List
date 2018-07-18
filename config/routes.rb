Rails.application.routes.draw do
  # resources :tags
  get 'items/create'

  resources :lists do
    resources :items
    resources :tags
  end

  get '/users/signup' => 'users#new'
  post '/users/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  get '/users/login' => 'sessions#new'
  post '/users/login' => 'sessions#create'

  root 'static#index'
end
