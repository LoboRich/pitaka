class MarketPortfolio < ApplicationRecord
  belongs_to :portfolio
  belongs_to :market

  def self.duplicate?(market, portfolio)
    portfolio.market_portfolios.where(market_id: market).any?
  end
end
