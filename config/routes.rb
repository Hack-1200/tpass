Rails.application.routes.draw do
  get 'main_pages/index'

 root 'users#index'  
end
