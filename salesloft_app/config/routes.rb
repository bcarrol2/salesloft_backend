Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users' => 'users#index'
  # post 'login' => 'users#login_user'
  # get 'users/scroll' =>'users#scroll'
  # post 'users/scroll' =>'users#scroll'

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
end
