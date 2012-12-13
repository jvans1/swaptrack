class AddColumnTournamentIdToRecuests < ActiveRecord::Migration
  def change
    add_column :recuests, :tournament_id, :integer
  end
end
