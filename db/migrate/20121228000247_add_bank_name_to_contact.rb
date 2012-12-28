class AddBankNameToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :bank_name, :string
  end
end
