class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    # ユーザー
    create_table :users do |t|
      t.string :name # 名前
      t.integer :age # 年齢

      t.timestamps
    end
  end
end
