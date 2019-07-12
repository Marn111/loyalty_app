class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.float :amount
      t.jsonb :items, null: false, default: '{}'
      t.integer :ordered_from
      t.integer :currency

      t.timestamps
    end
    add_index :purchases, :items, using: :gin
  end
end
