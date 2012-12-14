class Contract < ActiveRecord::Base
  # contract representing one account

  belongs_to :contact
  has_many :accounting_entries
  attr_accessible :duration_month, :duration_years, :interest_rate, :number, :start, :category, :comment

  #account balance for given date
  def balance date = DateTime.now.to_date
    accounting_entries.where("date <= ?", date).sum(:amount)
  end

  def interest_entries year = Date.now.year
    start_date = Date.new(year, 1, 1)
    end_date = Date.new(year, 12, 31)
    days_in_year = end_date.yday - start_date.yday + 1
    start_balance = balance(start_date)

    days_left = days_in_year
    fraction = days_left/days_in_year
    interest = start_balance * fraction * interest_rate
    interest_rows = [{:date => start_date, 
                      :name => "Saldo", 
                      :amount => start_balance,
                      :interest_rate => interest_rate, 
                      :days_left_in_year => days_left, 
                      :fraction_of_year => fraction, 
                      :interest => interest}]
    entries = accounting_entries.where(:date => start_date..end_date)
    entries.each do |entry|
      days_left = days_in_year - entry[:date].yday + 1
      fraction = 1.0 * days_left/days_in_year
      interest = entry[:amount] * fraction * interest_rate
      interest_rows.push({:date => entry[:date],
                          :name => entry[:amount] > 0 ? "Einzahlung" : "Auszahlung",
                          :amount => entry[:amount],
                          :interest_rate => interest_rate,
                          :days_left_in_year => days_left,
                          :fraction_of_year => fraction,
                          :interest => interest})
    end
    interest_rows
  end

  def interest year = Date.now.year
    rows = interest_entries year
    interest = rows.inject(0) {|sum, row| sum + row[:interest]}
    return interest, rows
  end
end 
