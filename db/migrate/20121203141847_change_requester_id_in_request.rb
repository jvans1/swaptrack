class ChangeRequesterIdInRequest < ActiveRecord::Migration
  def up
    remove_column :requests, :requester_id
    add_column :requests, :receiver_id, :integer
  end

  def down
  end
end
