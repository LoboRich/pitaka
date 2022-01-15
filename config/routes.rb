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
    get '/activity_suggestion', to: 'intertainments#activity_suggestion'
    get '/cat_fact', to: 'intertainments#cat_fact'
    get '/exchange_rate', to: 'intertainments#exchange_rate'
    get '/random_positive_emoji', to: 'intertainments#random_positive_emoji'
    get '/random_quote', to: 'intertainments#random_quote'
  end
  root 'accounts#index'
end
