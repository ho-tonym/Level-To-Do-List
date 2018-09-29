Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/user/items/create'

  get '/users/login' => 'sessions#new'
  post '/users/login' => 'sessions#create'
  get '/users/signup' => 'users#new'
  post '/users/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  # get '/users/time' => 'users#time'
  resources :users, except: [:new, :create] do
    resources :lists do
      resources :items
      resources :tags
    end
  end

  root 'lists#index'
end
