class Contact < ActiveRecord::Base
  has_many :contracts
  attr_accessible :account_number, :address, :bank_number, :bank_name, :name, :prename, :email, :phone, :remark
end
