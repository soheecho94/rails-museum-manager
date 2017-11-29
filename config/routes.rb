Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root 'application#hello'
  get '/hello', to: 'application#hello'
  get '/museums/most_artworks', to: 'museums#top', as: 'top_museum'
  get '/current_user', to: 'users#get_current'
  get '/museums/:id/artworks/:artwork_id/body', to: 'artworks#body'

  resources :categories, only: [:index, :new, :create, :show, :destroy] do
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:create, :update]
  resources :museums, only: [:new, :create, :edit, :update, :destroy]
  resources :museums, only: [:show] do
    resources :artworks
  end

  resources :artworks, only:[:show] do
    resources :user_comments, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :user_artworks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :locations, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
