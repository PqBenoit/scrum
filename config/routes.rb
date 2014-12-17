Rails.application.routes.draw do

  get 'classement/new'

  get 'classement/create'

  root 'pages#index'

  # RESSOURCES
  devise_for :users
  resources :teams
  resources :gladiators
  resources :equipments
  resources :users
  resources :classement

end
