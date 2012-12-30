class Contract < ActiveRecord::Base
  # contract representing one account

  belongs_to :contact
  has_many :accounting_entries
  attr_accessible :duration_month, :duration_years, :interest_rate, :number, :start, :category, :comment

  attr_accessor(:expiring)

  #account balance for given date
  def balance date = DateTime.now.to_date
    accounting_entries.where("date <= ?", date).sum(:amount)
  end

  def interest_entries_act_act year = Date.now.year
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
    entries = accounting_entries.where(:date => start_date..end_date).order(:date)
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

  def interest_entries_30E_360 year = Date.now.year
    start_date = Date.new(year, 1, 1)
    end_date = Date.new(year, 12, 31)
    start_balance = balance(start_date)

    interest = start_balance * interest_rate
    interest_rows = [{:date => start_date, 
                      :name => "Saldo", 
                      :amount => start_balance,
                      :interest_rate => interest_rate, 
                      :days_left_in_year => 360, 
                      :fraction_of_year => 1, 
                      :interest => interest}]
    entries = accounting_entries.where(:date => start_date..end_date).order(:date)
    entries.each do |entry|
      days_left = days360(entry[:date], end_date)
      fraction = 1.0 * days_left/360
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
    if SETTINGS[:interest_calculation_method] &&
        SETTINGS[:interest_calculation_method] == "act_act"
      rows = interest_entries_act_act year
    else
      rows = interest_entries_30E_360 year
    end
    interest = rows.inject(0) {|sum, row| sum + row[:interest]}
    return interest, rows
  end

  # only needed for dates within the same year 
  # will not work properly for dates in different years
  # http://en.wikipedia.org/wiki/360-day_calendar 30E/360
  def days360(date1,date2)
    day1 = date1.day
    day2 = date2.day
    month1 = date1.month
    month2 = date2.month
    year1 = date1.year
    year2 = date2.year
    if (year1 != year2)
      Rails.logger.warn "days360 does not calculate for dates from diverse years"
      return
    end
    if (month2 < month1 || (month2 == month1 && day2 < day1)) 
      Rails.logger.warn "date2 should be later than date1"
      return
    end

    days = [0,(month2 - month1 - 1)].max * 30  #full months
    
    if (month1 == month2) 
      days += day2 - day1
    else
      days += [30,day2].min
      days += 30 - [30,day1].min
    end

    return days
  end 

end 
