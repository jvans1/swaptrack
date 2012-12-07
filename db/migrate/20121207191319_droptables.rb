class Droptables < ActiveRecord::Migration
  def up
    drop_table :swaps
    drop_table :pieces
  end

  def down
  end
end
