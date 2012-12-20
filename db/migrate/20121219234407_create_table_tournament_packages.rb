class CreateTableTournamentPackages < ActiveRecord::Migration
  def up
    create_table :tournament_packages
    add_column :tournament_packages, :tournament_id, :integer
    add_column :tournament_packages, :package_id, :integer
  end

  def down
  end
end
