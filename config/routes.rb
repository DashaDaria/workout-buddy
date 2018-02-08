Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :users do
    resources :workouts, only: [:index, :new, :create], controller: 'users/workouts'
  end

  resources :workouts, only: [:show, :update, :destroy, :edit]
  resources :categories, only: [:show]
  resources :exercises, only: [:index, :show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get'/exercises/:id/body', to: 'exercises#body'
end
