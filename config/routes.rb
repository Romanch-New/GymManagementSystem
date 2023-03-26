# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get 'home/index', to: 'home#index'

  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :new, :create]
  end

end
