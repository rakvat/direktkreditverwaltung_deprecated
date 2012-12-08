class Contact < ActiveRecord::Base
  has_many :contracts
  attr_accessible :account_number, :address, :bank_number, :name, :prename
end
