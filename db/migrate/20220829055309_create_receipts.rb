class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :title
      t.integer :amount
      t.datetime :issued_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
