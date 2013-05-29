class ContractVersion < ActiveRecord::Base
  belongs_to :contract
  attr_accessible :duration_months, :duration_years, :interest_rate, :start, :version

  validates_presence_of :interest_rate, :start, :version

  def interest_rate=(interest)
    interest = interest.to_f
    raise "Interest should be between 0.00 and 0.09" unless (0.00 .. 0.09).cover?(interest)
    write_attribute(:interest_rate, interest)
  end

end
