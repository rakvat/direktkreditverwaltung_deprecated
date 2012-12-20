class RemoveColumnProcessFromAccountingEntries < ActiveRecord::Migration
  def change
    remove_column :accounting_entries, :process
  end
end
