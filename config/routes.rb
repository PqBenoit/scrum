Rails.application.routes.draw do
  # HOMEPAGE
  root 'pages#index'

  # RESSOURCES
  devise_for :users
end
