class CreateGladiators < ActiveRecord::Migration
  def change
    create_table :gladiators do |t|
      t.string :name
      t.integer :victories
      t.integer :fights

      t.timestamps
    end
  end
end
