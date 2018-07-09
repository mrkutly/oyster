Rails.application.routes.draw do

  resources :users, except: :index
  get '/users/:id/welcome', to: 'users#welcome', as: 'welcome'

end
