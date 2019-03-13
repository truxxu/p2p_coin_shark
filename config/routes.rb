Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :loans, only: [:index, :show, :new, :create] do
    resources :requests, only: [:index, :show, :new, :create]
  end

  get 'users/:id/loans' => 'loans#my_loans', as: :my_loans
  get 'users/:id/my_loan_requests' => 'loans#my_loan_requests', as: :my_loan_requests
  get 'users/:id/requests' => 'requests#my_requests', as: :my_requests
end
