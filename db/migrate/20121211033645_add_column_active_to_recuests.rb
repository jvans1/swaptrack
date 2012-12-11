class AddColumnActiveToRecuests < ActiveRecord::Migration
  def change
    add_column :recuests, :active, :boolean
  end
end
