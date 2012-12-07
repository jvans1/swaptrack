class AddForeignKeysToSwap < ActiveRecord::Migration
  def change
    add_column :swaps, :user_id, :integer
    add_column :swaps, :receiver_id, :integer

  end
end
