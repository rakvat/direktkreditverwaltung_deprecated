class CreateAccountingEntries < ActiveRecord::Migration
  def change
    create_table :accounting_entries do |t|
      t.string :process
      t.date :date
      t.float :amount
      t.references :contract

      t.timestamps
    end
    add_index :accounting_entries, :contract_id
  end
end
