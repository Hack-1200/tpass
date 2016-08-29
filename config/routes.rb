Rails.application.routes.draw do
  

  # resources :users
  get '/new', to: 'users#new'
  get '/show', to: 'users#show'
  root 'main_pages#index'  
end
