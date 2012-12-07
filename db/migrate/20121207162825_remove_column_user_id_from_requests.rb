class RemoveColumnUserIdFromRequests < ActiveRecord::Migration
  def up
    remove_column :requests, :user_id
    remove_column :requests, :tournament_id
    remove_column :requests, :receiver_id
  end

  def down
  end
end
