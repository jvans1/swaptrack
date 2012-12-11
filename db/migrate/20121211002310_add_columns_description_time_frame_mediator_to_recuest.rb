class AddColumnsDescriptionTimeFrameMediatorToRecuest < ActiveRecord::Migration
  def change
    add_column :recuests, :description, :string
    add_column :recuests, :time_frame, :datetime
  end
end
