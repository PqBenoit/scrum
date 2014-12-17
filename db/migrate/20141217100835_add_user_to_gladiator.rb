class AddUserToGladiator < ActiveRecord::Migration
  def change
  	add_reference :gladiators, :user, index: true
  end
end
