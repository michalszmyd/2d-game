Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :lobby, only: [:index, :show]
  resources :developer, only: :index
end
