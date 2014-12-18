class ResetTaMere < ActiveRecord::Migration
  def change
  	add_reference :gladiator_equipments, :gladiator, index: true
  	add_reference :gladiator_equipments, :equipment, index: true
  end
end
