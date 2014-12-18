Rails.application.routes.draw do

  root 'teams#index'
  post 'teams/set_equipment', to: 'teams#set_equipment', as: 'set_equipment'

  # RESSOURCES
  devise_for :users
  resources :teams do
    collection do
      get 'destroy_equipment'
    end
  end
  resources :gladiators
  resources :equipments
  resources :users
  resources :classement
  resources :tournaments do
    collection do
      get 'register'
      get 'unregister'
    end
  end

end
