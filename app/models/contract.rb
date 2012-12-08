class Contract < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :duration_month, :duration_years, :interest_rate, :number, :start
end
