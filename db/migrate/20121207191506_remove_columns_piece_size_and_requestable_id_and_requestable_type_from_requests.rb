class RemoveColumnsPieceSizeAndRequestableIdAndRequestableTypeFromRequests < ActiveRecord::Migration
  def up
    remove_column :requests, :requestable_id
    remove_column :requests, :requestable_type
  end

  def down
  end
end
