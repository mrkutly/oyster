Rails.application.routes.draw do

  # Users routes
  resources :users, except: [:index, :new]

  get '/users/:id/welcome', to: 'users#welcome', as: 'welcome'
  get '/users/:id/home', to: 'users#home', as: 'home'

  # Sessions routes
  get '/', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  # Trips routes
  resources :trips, except: [:index, :new, :destroy]
  delete 'trips/:id', to: 'trips#destroy', as: 'delete_trip'

  #Photo Album resources
  resources :photo_albums, only: [:show, :create]

  #Photo routes
  resources :photos, only: [:new, :create, :show]
  delete 'photos/:id', to: 'photos#destroy', as: "delete_photo"

  #journal entries routes
  resource :journal_entries, only: [:index, :create]
  get '/journal_entries/:id', to: 'journal_entries#show', as: 'journal_entry'
  delete 'journal_entries/:id', to: 'journal_entries#destroy', as: "delete_journal_entry"
end
