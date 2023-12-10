Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks do
    member do
      patch 'update_status'
      patch 'move_up'
      patch 'move_down'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '*path', to: 'sessions#new'

  # Defines the root path route ("/")
  # root "posts#index"
  root 'sessions#new'
end
