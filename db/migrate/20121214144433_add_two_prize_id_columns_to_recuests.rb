class AddTwoPrizeIdColumnsToRecuests < ActiveRecord::Migration
  def change
    remove_column :recuests, :prize_id
    add_column :recuests, :receiver_prize_id, :integer
    add_column :recuests, :user_prize_id, :integer
  end
end
