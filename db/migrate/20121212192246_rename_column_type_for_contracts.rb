class RenameColumnTypeForContracts < ActiveRecord::Migration
  def change
    rename_column :contracts, :type, :category
  end
end
