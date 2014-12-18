class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|

      t.timestamps
    end
  end
end
