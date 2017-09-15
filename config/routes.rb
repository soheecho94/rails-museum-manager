Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'

  resources :categories
  resources :artworks
  resources :museums
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
