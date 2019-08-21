Rails.application.routes.draw do
  devise_for :users
  get 'landing/index'
  resources :posts
  root 'landing#index'
  get '/user_profile', to: 'posts#user_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
