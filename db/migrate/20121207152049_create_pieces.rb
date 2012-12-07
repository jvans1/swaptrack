class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :size
      t.integer :user_id
      t.integer :receiver_id
      t.integer :tournament_id
      t.timestamps
    end
  end
end
