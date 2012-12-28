class AddRemarkToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :remark, :string
  end
end
