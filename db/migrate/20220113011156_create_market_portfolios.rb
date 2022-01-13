class CreateMarketPortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :market_portfolios, id: :uuid do |t|
      t.uuid :portfolio_id
      t.uuid :market_id
      t.float :stocks
      t.float :revenue

      t.timestamps
    end
  end
end
