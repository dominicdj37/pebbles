Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get '/home', to: 'home#index'

  get '/devices', to: 'my_devices#index' 
  get '/devices/new', to: 'my_devices#new'
  post '/devices', to: 'my_devices#create'
end
