class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :buy_in
      t.integer :place
      t.integer :prize
      t.timestamps
    end
  end
end
