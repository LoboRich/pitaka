class Market < ApplicationRecord
  mount_uploader :logo, AvatarUploader
  validates :name, :symbol, :supply, :market_cap, presence: true
  validates_uniqueness_of :name
  has_many :market_portfolios

  def self.deduct_stocks(market, stocks)
    market.update!(supply: market.supply - stocks.to_f)
  end

  def self.add_stocks(market, stocks)
    market.update!(supply: market.supply + stocks.to_f)
  end

  def self.sufficient_supply?(market, stocks)
    market.supply > stocks.to_f
  end

  def price
    self.market_cap / self.supply
  end
end
