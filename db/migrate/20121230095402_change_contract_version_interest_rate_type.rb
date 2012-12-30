class ChangeContractVersionInterestRateType < ActiveRecord::Migration
  def change
    change_column :contract_versions, :interest_rate, :float
  end
end
