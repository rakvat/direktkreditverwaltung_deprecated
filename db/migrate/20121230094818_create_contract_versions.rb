class CreateContractVersions < ActiveRecord::Migration
  def change
    create_table :contract_versions do |t|
      t.date :start
      t.integer :duration_months
      t.integer :duration_years
      t.integer :interest_rate
      t.integer :version
      t.references :contract

      t.timestamps
    end
    add_index :contract_versions, :contract_id
  end
end
