class RemoveColumnPieceSizeFromRequests < ActiveRecord::Migration
  def up
    rename_column :requests, :piece_size, :percent
  end

  def down
  end
end
