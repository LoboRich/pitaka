class Portfolio < ApplicationRecord
  has_many :market_portfolios
  belongs_to :account
end
