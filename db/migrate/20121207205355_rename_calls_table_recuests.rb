class RenameCallsTableRecuests < ActiveRecord::Migration
  def up
    rename_table :calls, :recuests
  end

  def down
  end
end
