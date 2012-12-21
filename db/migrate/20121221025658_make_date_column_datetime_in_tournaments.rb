class MakeDateColumnDatetimeInTournaments < ActiveRecord::Migration
  def up
    remove_column :tournaments, :date 
    add_column :tournaments, :date, :datetime 
  end

  def down
  end
end
