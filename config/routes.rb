Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  resources :users do
    resources :workouts
  end

  resources :exercises

  resources :categories, only: [:show] do
    resources :exercises, only: [:index]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
