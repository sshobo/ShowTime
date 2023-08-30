Rails.application.routes.draw do
  resources :videos
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'pages#dashboard'

  resources :users, only: [:index, :show]
end
