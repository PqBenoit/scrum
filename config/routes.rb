Rails.application.routes.draw do

  root 'pages#index'

  # RESSOURCES
  devise_for :users
  resources :teams
  resources :gladiators
  resources :users

end
