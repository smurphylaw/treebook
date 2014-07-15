 Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :registrations
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/registrations#destroy', as: :logout
  end

  resources :statuses
  get 'feed', to: 'statuses#index'
  root to: 'statuses#index'

end
