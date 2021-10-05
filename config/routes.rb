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
    post '/auto_login', to: 'authentication#auto_login'
    post '/sign_up', to: 'user#create'
    
    
    get '/get_pebbles', to: 'pebble#getPebbles'
    post '/create_pebble', to: 'pebble#create'
    post '/share_pebble', to: 'pebble#share'
    post '/save_token', to: 'mobile_device#registerToken'
    post '/delete_token', to: 'mobile_device#deleteToken'

  end

end
