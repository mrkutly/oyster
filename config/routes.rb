Rails.application.routes.draw do

  # Users routes
  resources :users, except: [:index, :new] do
    #Photo Album resources
    resources :photo_albums, except: [:index, :new]
  end


  get '/users/:id/welcome', to: 'users#welcome', as: 'welcome'
  get '/users/:id/home', to: 'users#home', as: 'home'

  # Sessions routes
  get '/', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  # Trips routes
  resources :trips, except: [:index, :new]

  #Photo routes
  resources :photos, only: [:new, :create]


end
