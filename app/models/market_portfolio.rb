class MarketPortfolio < ApplicationRecord
  
  belongs_to :market
  belongs_to :portfolio

  after_create :create_log
  
  def create_log 
    Log.create(account:self, description: "Purchased")
  end
end
