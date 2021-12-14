Rails.application.routes.draw do
  resources :wallets
  resources :markets
  devise_for :users
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
