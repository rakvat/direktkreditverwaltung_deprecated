class AccountingEntry < ActiveRecord::Base
  belongs_to :contract
  attr_accessible :amount, :date
end
