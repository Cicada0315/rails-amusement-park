Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :rides
  resources :attractions
  resources :users
  #resources :sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'  
end
