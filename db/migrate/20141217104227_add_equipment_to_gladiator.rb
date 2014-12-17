class AddEquipmentToGladiator < ActiveRecord::Migration
  def change
    add_reference :gladiators, :equipment, index: true
  end
end
