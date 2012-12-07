class RemoveColumnsInPiece < ActiveRecord::Migration
  def up
    remove_column :pieces, :user_id
    remove_column :pieces, :receiver_id
  end

  def down
  end
end
