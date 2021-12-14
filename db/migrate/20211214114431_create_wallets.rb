class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.uuid :account_id
      t.float :balance

      t.timestamps
    end
  end
end
