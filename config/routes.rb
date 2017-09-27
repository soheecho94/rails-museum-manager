Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root 'application#hello'
  get '/museums/most_artworks', to: 'museums#top', as: 'top_museum'

  resources :categories, only: [:index, :new, :create, :show, :destroy]
  resources :artworks, only: [:create, :update]
  resources :museums, only: [:new, :create, :edit, :update, :destroy]
  resources :museums, only: [:show] do
    resources :artworks
  end

  resources :user_comments, only: [:new, :create]
  resources :user_artworks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :locations, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
