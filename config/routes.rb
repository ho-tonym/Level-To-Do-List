Rails.application.routes.draw do
  # resources :tags
  resources :lists do
    resources :items
    resources :tags
  end
# resources :users , only: [:show] do  #account info
  # # resources :users , only: [:new, :create]
  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'

  # resources :sessions , only: [:new, :create, :destroy]

    # resources :users
  get '/users/signup' => 'users#new'
  post '/users/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  get '/users/login' => 'sessions#new'
  post '/users/login' => 'sessions#create'

  root 'static#index'
end
