Rails.application.routes.draw do
  root "top#main"
  post "top/login"
  get  "top/logout"
  resources :users, only: [:index, :show, :new, :create, :destroy]
  resources :tweets, only: [:create]
  resources :likes, only: [:create, :destroy]
  resource :profile, only: [:edit, :update, :destroy]
end