Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: 'pages#home'
  get '/about', to:'pages#about'

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end
end
