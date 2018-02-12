Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :users, only: [:show]

  resources :users do
    resources :workouts, only: [:index], controller: 'users/workouts'
  end

  resources :workouts, only: [:create, :new, :show, :update, :destroy, :edit]

  resources :workouts, only: [:show] do
    resources :exercises, only: [:index, :create,], controller: 'workouts/exercises'
end

  resources :exercises, only: [:show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
