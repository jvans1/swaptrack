class AddTournamentIdToSwaps < ActiveRecord::Migration
  def change
    add_column :swaps, :tournament_id, :integer
  end
end
