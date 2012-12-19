class AddColumnMarkupToRecuests < ActiveRecord::Migration
  def change
    add_column :recuests, :markup, :decimal
  end
end
