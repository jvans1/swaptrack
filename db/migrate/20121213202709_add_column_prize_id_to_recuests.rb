class AddColumnPrizeIdToRecuests < ActiveRecord::Migration
  def change
    add_column :recuests, :prize_id, :integer
  end
end
