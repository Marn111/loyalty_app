class AddCollectedPointsInPurchaseModel < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :collected_points, :float, default: 0.0
  end
end
