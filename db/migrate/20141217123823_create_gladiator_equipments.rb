class CreateGladiatorEquipments < ActiveRecord::Migration
  def change
    create_table :gladiator_equipments do |t|
    	
      	t.timestamps
    end
  end
end
