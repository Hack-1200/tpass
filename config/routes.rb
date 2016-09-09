Rails.application.routes.draw do
  

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users
  # get '/new', to: 'users#new'
  # get /'/show', to: 'users#show'
  root 'main_pages#index'  
end
