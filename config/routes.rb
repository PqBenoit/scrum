Rails.application.routes.draw do

  root 'teams#index'
  post 'teams/set_equipment', to: 'teams#set_equipment', as: 'set_equipment'

  # RESSOURCES
  devise_for :users
  resources :teams
  resources :gladiators
  resources :equipments
  resources :users
  resources :tournaments do
    collection do
      get 'register'
      get 'unregister'
    end
  end

end
