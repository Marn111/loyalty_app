class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :birthday
      t.float :points, default: 0.0
      t.integer :origin_country

      t.timestamps
    end
  end
end
