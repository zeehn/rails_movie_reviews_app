Rails.application.routes.draw do
  root 'movies#index'

  resources :movies do 
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get 'movies/filter/:filter', to: 'movies#index', as: :filtered_movies

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'

  
  # get 'movies', to: 'movies#index'
  # post 'movies', to: 'movies#create'
  # get 'movies/new', to: 'movies#new', as: 'new_movie'
  # get 'movies/:id', to: 'movies#show', as: 'movie'
  # get 'movies/:id/edit', to: 'movies#edit', as: 'edit_movie'
  # patch 'movies/:id', to: 'movies#update'
  # delete 'movies/:id', to: 'movies#destroy'
end
