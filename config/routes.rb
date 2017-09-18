Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'

  resources :categories, only: [:index, :new, :create, :show]
  resources :artworks, only: [:create, :update]
  resources :museums, only: [:new, :create, :edit, :update, :destroy]
  resources :museums, only: [:show] do
    resources :artworks
  end

  resources :user_artworks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :locations, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
