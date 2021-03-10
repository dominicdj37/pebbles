Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get '/home', to: 'home#index'

  get '/devices', to: 'my_devices#index' 
  get '/devices/new', to: 'my_devices#new'
  post '/devices', to: 'my_devices#create'

  namespace :v1 do
    get '/settings', to: 'settings#getSettings' 

    post '/authenticate', to: 'authentication#create'
    post '/sign_up', to: 'user#create'
  end

end
