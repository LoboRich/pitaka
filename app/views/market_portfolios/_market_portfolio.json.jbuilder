json.extract! market_portfolio, :id, :portfolio_id, :market_id, :stocks, :revenue, :created_at, :updated_at
json.url market_portfolio_url(market_portfolio, format: :json)
