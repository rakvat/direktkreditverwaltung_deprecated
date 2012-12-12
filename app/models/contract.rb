class Contract < ActiveRecord::Base
  belongs_to :contact
  has_many :accounting_entries
  attr_accessible :duration_month, :duration_years, :interest_rate, :number, :start, :category, :comment
end
