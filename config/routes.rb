Rails.application.routes.draw do
  
  root 'sessions#home'

  get '/preview' => 'ratings#preview' 
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :ratings
  resources :courses

  resources :users do 
    resources :ratings
  end

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
end
