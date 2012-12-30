class RemoveColumnsFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :start
    remove_column :contracts, :duration_month
    remove_column :contracts, :duration_years
  end
end
