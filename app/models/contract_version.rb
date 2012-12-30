class ContractVersion < ActiveRecord::Base
  belongs_to :contract
  attr_accessible :duration_months, :duration_years, :interest_rate, :start, :version
end
