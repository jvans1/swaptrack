class AddColumnAmountToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :amount, :integer
  end
end
