Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'

  resources :categories [:new, :create]
  resources :artworks
  resources :museums, only: [:new, :create, :edit, :update]
  resources :museums, only: [:show] do
    resources :artworks
  end

  resources :users
  resources :locations, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
