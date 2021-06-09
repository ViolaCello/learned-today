Rails.application.routes.draw do


  get '/', to: 'sessions#welcome', as: 'home'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  delete 'logout', to: 'sessions#destroy'


  resources :topics
  resources :users do 
  resources :entries
  end 
  
  resources :entries  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
