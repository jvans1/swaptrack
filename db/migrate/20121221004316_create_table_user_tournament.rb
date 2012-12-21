class CreateTableUserTournament < ActiveRecord::Migration
  def up
    create_table :user_tournaments
    add_column :user_tournaments, :user_id, :integer
    add_column :user_tournaments, :tournament_id, :integer
  end

  def down
  end
end
