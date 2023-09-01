Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'pages#dashboard'

  resources :videos do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:index, :show]
end
