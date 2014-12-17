class CreateTournamentUsers < ActiveRecord::Migration
  def change
    create_table :tournament_users do |t|
      t.belongs_to :user
      t.belongs_to :tournament
      t.timestamps
    end
  end
end
