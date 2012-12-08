class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :prename
      t.string :address
      t.string :account_number
      t.string :bank_number

      t.timestamps
    end
  end
end
