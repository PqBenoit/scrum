class AddTeamToGladiator < ActiveRecord::Migration
  def change
  	add_reference :gladiators, :team, index: true
  end
end
