class AddPointsToEquipments < ActiveRecord::Migration
  def change
    add_column :equipment, :points, :integer
  end
end
