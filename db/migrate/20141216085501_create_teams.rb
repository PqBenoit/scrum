class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :victories
      t.integer :fights
      
      t.timestamps
    end
  end
end
