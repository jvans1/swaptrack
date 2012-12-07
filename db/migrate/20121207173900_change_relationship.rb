class ChangeRelationship < ActiveRecord::Migration
  def up
    add_column :users, :inbound_requests, :integer
    add_column :requests, :user_id, :integer 
    add_column :requests, :receiver_id, :integer
    add_column :requests, :requestable_id, :integer
    add_column :requests, :requestable_type, :string
  end

  def down
  end
end
