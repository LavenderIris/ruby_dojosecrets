Rails.application.routes.draw do

  delete 'likes/:id'  => 'likes#destroy'
  post 'likes'  => 'likes#create'
  
  post 'secrets'  => 'secrets#create'
  get '/secrets'  => 'secrets#index'
  delete 'secrets/:id'  => 'secrets#destroy'

  get 'users/new'   => 'users/new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id'  => "users#show"
  post 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#delete' 

  get 'sessions/new'   => 'sessions#new'
  post '/create'  => 'sessions#create'
  delete 'sessions/:id'  => 'sessions#destroy'


end
