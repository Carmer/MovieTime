Rails.application.routes.draw do

  get '/sign_up', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:create, :show]

  resources :movies, only: [:index, :new, :create]
end
