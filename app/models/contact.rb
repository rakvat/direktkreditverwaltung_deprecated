class Contact < ActiveRecord::Base
  attr_accessible :account_number, :address, :bank_number, :name, :prename
end
