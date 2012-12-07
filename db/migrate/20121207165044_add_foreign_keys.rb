class AddForeignKeys < ActiveRecord::Migration
  def up
    add_column :pieces, :user_id, :integer
    add_column :pieces, :receiver_id, :integer
  end

  def down
  end
end
