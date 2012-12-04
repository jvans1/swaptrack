class AddColumnToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :date, :date
    add_column :tournaments, :entries, :integer
  end
end
