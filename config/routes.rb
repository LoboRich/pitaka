Rails.application.routes.draw do
  resources :wallets
  resources :logs
  resources :markets do
    member do
      post :buy
      post :sell
    end
  end

  devise_for :users
  resources :users
  resources :accounts do
    resources :logs
    resources :portfolios do
      resources :market_portfolios
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    get '/today_quote', to: 'quotes#index'
  end
  root 'accounts#index'
end
