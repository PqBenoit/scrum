class AddPointsToGladiators < ActiveRecord::Migration
  def change
    add_column :gladiators, :points_equipment, :integer
  end
end
