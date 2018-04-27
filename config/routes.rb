Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end
end
