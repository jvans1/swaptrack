class Deletedepricatedkeys < ActiveRecord::Migration
  def up
    remove_column :users, :tournament_id
  end

  def down
  end
end
