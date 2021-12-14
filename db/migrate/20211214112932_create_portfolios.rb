class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios, id: :uuid do |t|
      t.uuid :account_id

      t.timestamps
    end
  end
end
