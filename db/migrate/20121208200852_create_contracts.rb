class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :number
      t.references :contact
      t.date :start
      t.integer :duration_month
      t.integer :duration_years
      t.float :interest_rate

      t.timestamps
    end
    add_index :contracts, :contact_id
  end
end
