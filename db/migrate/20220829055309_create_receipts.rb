class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    # レシート
    create_table :receipts do |t|
      t.string :title # 名前
      t.integer :amount # 金額
      t.datetime :issued_at # 発行日
      t.references :user, null: false, foreign_key: true # 発行したユーザー

      t.timestamps
    end
  end
end
