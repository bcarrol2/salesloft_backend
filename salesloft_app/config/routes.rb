Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      get 'users' => 'users#index'
      get 'users/scroll' =>'users#scroll'
      post 'users/scroll' =>'users#scroll'
    end
  end
end
