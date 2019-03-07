Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :loans, only: [:index, :show] do
    resources :requests, only: [:index, :show]
  end

  get 'users/:id/loans' => 'loans#my_loans', as: :my_loans
  get 'users/:id/requests' => 'requests#my_requests', as: :my_requests
end
