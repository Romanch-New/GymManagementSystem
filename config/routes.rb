# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get 'home/index', to: 'home#index'

  namespace :user, as: '' do
    devise_for :users, path: ''
  end

  namespace :admins, as: '' do
    devise_for :admins, path: ''
    resources :users, only: [:new, :create], as: 'admin_users'
  end

end
