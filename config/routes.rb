# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  scope module: :users do
    devise_for :users
  end

  scope module: :admins do
    devise_for :admins
    resources :users, only: [:new, :create], as: 'admin_users', path: 'admin/users'
    namespace :users, as: 'admin', path: 'admin' do
      devise_for :users
    end
  end

end
