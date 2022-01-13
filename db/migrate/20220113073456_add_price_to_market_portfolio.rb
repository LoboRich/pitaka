class AddPriceToMarketPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :market_portfolios, :price, :float
  end
end
