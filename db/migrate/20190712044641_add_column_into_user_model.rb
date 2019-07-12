class AddColumnIntoUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rewards, :jsonb, null: false, default: '{}'
    add_index :users, :rewards, using: :gin
  end
end
