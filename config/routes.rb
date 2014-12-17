Rails.application.routes.draw do

  root 'teams#index'

  # RESSOURCES
  devise_for :users
  resources :teams
  resources :gladiators
  resources :equipments
  resources :users
  resources :classement

end
