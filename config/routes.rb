Rails.application.routes.draw do
  devise_for :users

  root 'coffeespots#index'

  resources :users

  resources :coffeespots do
    resources :reviews
  end

end
