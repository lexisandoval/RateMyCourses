Rails.application.routes.draw do
  
  root 'sessions#home'

  get '/signup' => 'users#new'
  # get '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # get '/logout', to: "sessions#destroy"
  delete '/logout' => 'sessions#destroy'
  
  resources :ratings
  # resources :subjects
  resources :courses

  resources :users do 
    resources :ratings, only: [:new, :create, :index, :show, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
