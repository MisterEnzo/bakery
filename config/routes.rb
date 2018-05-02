Rails.application.routes.draw do

  root to: 'pages#home'
  get '/about', to:'pages#about'
  get '/contact', to:'pages#contact'

  resources :posts

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
    resources :order_details, only: [:new, :create]
  end

  devise_for :users
end
