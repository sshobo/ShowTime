Rails.application.routes.draw do
  get 'studios/new'
  get 'studios/index'
  get 'studios/show'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'pages#dashboard'

  resources :videos do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:index, :show]
  resources :studios, only: [:index, :show]
end
