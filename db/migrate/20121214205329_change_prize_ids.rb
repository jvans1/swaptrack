class ChangePrizeIds < ActiveRecord::Migration
  def up
    remove_column :recuests, :user_prize_id
    remove_column :recuests, :receiver_prize_id
    add_column :prizes, :swap_id, :integer
    add_column :prizes, :receiver_prize_id, :integer
  end

  def down
  end
end
