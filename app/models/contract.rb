class Contract < ActiveRecord::Base
  # contract representing one account

  belongs_to :contact
  has_many :accounting_entries
  attr_accessible :duration_month, :duration_years, :interest_rate, :number, :start, :category, :comment

  #account balance for given date
  def balance date=DateTime.now.to_date
    entries = accounting_entries.where("date <= ?", date)
    entries.inject(0) {|sum, entry| sum + entry[:amount]}
  end
end 
