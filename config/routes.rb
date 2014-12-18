Rails.application.routes.draw do

  root 'teams#index'
  post 'teams/set_equipment', to: 'teams#set_equipment', as: 'set_equipment'
  get  '/send_invite', to: 'application#send_invite', as: 'send_invite'
  post 'teams/set_gladiator', to: 'teams#set_gladiator', as: 'set_gladiator'


  # RESSOURCES
  devise_for :users
  resources :teams do
    collection do
      get 'destroy_equipment'
      get 'destroy_gladiator'
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
