Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :locations, only: [:new, :index, :create]

  resources :pop_funkos do
    resources :locations, only: [:new, :index]  
  end 

  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
