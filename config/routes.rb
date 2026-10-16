Rails.application.routes.draw do
  root "top#main"
  post "top/login"
  get  "top/logout"
  resources :users, only: [:index, :new, :create, :destroy]
end