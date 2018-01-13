Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :lobby, only: [:index, :show]
  resources :developer, only: :index
  resources :items, only: [:new, :create, :edit, :update, :destroy]
  resources :worlds, only: [:new, :create, :edit, :update, :destroy]
  resources :hero_roles, only: [:new, :create, :edit, :update, :destroy]
  resources :environments, only: [:new, :create, :edit, :update, :destroy]
end
