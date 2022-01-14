class MarketPortfolio < ApplicationRecord
  belongs_to :portfolio
  belongs_to :market

  def self.duplicate?(market, portfolio)
    portfolio.market_portfolios.where(market_id: market).any?
  end

  def self.revenue(portfolio)
    portfolio.market_portfolios.map{|x| x.price - x.market.price}.sum
  end
end
