class RemoveAnotherColumnFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :interest_rate
  end
end
