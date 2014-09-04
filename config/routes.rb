Rails.application.routes.draw do
  devise_for :users

  root 'coffeespots#index'

  resources :posts

  resources :users do
   	resources :reviews
  end

  resources :coffeespots do
   	resources :reviews
  end


end
