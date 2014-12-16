class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :damage
      t.integer :priority
      t.integer :defense

      t.timestamps
    end
  end
end
