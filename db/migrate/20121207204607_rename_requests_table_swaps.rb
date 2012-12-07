class RenameRequestsTableSwaps < ActiveRecord::Migration
  def up
    rename_table :requests, :calls
  end

  def down
  end
end
