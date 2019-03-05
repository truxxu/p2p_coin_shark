Rails.application.routes.draw do
  get 'requests/index'
  get 'loans/index'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :loans, only: [:index, :show] do
    resources :requests, only: [:index, :show]
  end
end
