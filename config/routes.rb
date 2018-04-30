Rails.application.routes.draw do
  get 'order_details/new'

  get 'order_details/create'

  resources :posts
  devise_for :users
  root to: 'pages#home'
  get '/about', to:'pages#about'

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
    resources :order_details, only: [:new, :create]
  end
end
