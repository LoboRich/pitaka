Rails.application.routes.draw do
  resources :logs
  resources :markets do
    member do
      post :buy
      post :sell
      post :remove_market
    end
  end

  devise_for :users
  resources :users
  resources :accounts do
    resources :logs
    resources :portfolios do
      resources :market_portfolios
    end

    member do
      post :remove_account
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    get '/today_quote', to: 'quotes#index'
  end
  root 'accounts#index'
end
