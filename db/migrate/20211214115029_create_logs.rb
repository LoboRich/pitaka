class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs, id: :uuid do |t|
      t.uuid :account_id
      t.text :description

      t.timestamps
    end
  end
end
