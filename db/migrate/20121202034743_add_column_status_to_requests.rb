class AddColumnStatusToRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :status
    add_column :requests, :status, :integer
  end
end
