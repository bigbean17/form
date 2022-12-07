Rails.application.routes.draw do

  root "login#new"

  resources :login, only: [:new, :create]
  get 'signin', to: 'login#new', as: :signin
  
  resources :register, only:[:new, :create]
  get 'signup', to: 'register#new', as: :signup
  post 'signup', to: 'register#create', as: :signup_post

  resources :main, only: [:index]
  get  "new_drones", to: 'drones#new', as: :drones_get
  post "new_drones", to: 'drones#create', as: :drones_post
  get "my_drones", to: "drones#index", as: :my_drones
  get "new_drones/model", to: 'drones#model', as: :model_get


  resources :pilots
  resources :drones

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
