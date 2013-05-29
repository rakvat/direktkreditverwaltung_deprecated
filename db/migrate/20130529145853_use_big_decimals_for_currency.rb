class UseBigDecimalsForCurrency < ActiveRecord::Migration
  def change
    change_column :accounting_entries, :amount, :decimal, precision: 14, scale: 2 #is enough to store bill_gates_money :)

    change_column :contract_versions, :interest_rate, :decimal, precision: 5, scale: 4 #Weniger als 0,01% makes no sense
  end
end
