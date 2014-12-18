class AddReferencesToUserTeam < ActiveRecord::Migration
  def change
  	add_reference :user_teams, :user, index: true
  	add_reference :user_teams, :team,  index: true
  end
end
