class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :piece_size
      t.integer :tournament_id
      t.integer :user_id
      t.timestamps
    end
  end
end
