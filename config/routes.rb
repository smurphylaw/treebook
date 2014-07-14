 Rails.application.routes.draw do

  devise_for :users
  resources :statuses

  root to: 'statuses#index'

end
