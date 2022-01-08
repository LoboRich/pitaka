class Market < ApplicationRecord
  mount_uploader :logo, AvatarUploader
  validates :name, uniqueness: { scope: :name, message: "Market name already exists." }
  validates :symbol, presence: true 
  validates :description, presence: true
  has_many :market_portfolios

  def self.deduct_stocks(market, stocks)
    market.update!(supply: market.supply - stocks.to_f)
  end

  def self.sufficient_supply?(market, stocks)
    market.supply > stocks
  end
end
