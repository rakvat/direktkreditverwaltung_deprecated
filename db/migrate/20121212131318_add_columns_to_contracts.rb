class AddColumnsToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :comment, :string
    add_column :contracts, :type, :string
  end
end
