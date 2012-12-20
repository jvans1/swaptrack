class AddColumnPackageIdToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :package_id, :integer
  end
end
