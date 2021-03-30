Rails.application.routes.draw do
  
  get '/signup' => 'users#new'
  # get '/signup' => 'users#create'
  
  resources :ratings
  resources :subjects
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
