Rails.application.routes.draw do
  
  root 'sessions#home'

  get '/signup' => 'users#new'
  # get '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :ratings
  # resources :subjects
  resources :courses

  resources :users do 
    resources :ratings
  end

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
