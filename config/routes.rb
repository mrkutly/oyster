Rails.application.routes.draw do

  resources :users, except: :index
  get '/users/:id/welcome', to: 'users#welcome', as: 'welcome'
  get '/sessions', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

end
