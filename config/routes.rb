Rails.application.routes.draw do
  resources :wallets
  resources :logs
  resources :portfolios
  resources :market_portfolios
  resources :markets
  devise_for :users
  resources :users
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'accounts#index'
end
