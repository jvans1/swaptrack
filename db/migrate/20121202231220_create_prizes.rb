class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.integer :amount
      t.integer :tournament_id
      t.date :date
      t.integer :place
      t.timestamps
    end
  end
end
