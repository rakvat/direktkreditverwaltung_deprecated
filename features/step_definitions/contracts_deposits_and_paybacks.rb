Given(/^The date is "(.*?)"$/) do |date|
  Timecop.freeze(Date.parse(date))
end

Given(/^DK contract (\d+) has a balance of (\d+\.\d+) euro and interest of (\d+\.\d+)%$/) do |dk_number, balance, interest|
  contract = Contract.create(number: dk_number)
  balance = balance.to_f
  interest = interest.to_f
  last_version = ContractVersion.new
  last_version.version = 1
  last_version.contract_id = contract.id
  last_version.start = Time.now
  last_version.interest_rate = interest
  last_version.save
  contract.accounting_entries.create(amount: balance, date: Time.now)
  p balance
  p interest
  p contract.balance(Time.now)
end

When(/^Time passes$/) do
  true #always
end

When(/^Time passes and it is the "(.*?)"$/) do |date|
  Timecop.travel(Date.parse(date))
end

When(/^For DK contract (\d+) a deposit of (\d+\.\d+) euro is made on the "(.*?)"$/) do |dk_number, deposit, date|
  contract = Contract.find_by_number(dk_number)
  deposit = deposit.to_f
  contract.accounting_entries.create(amount: deposit, date: Date.parse(date))
  p deposit
  p contract.balance(Time.now)
end


When(/^For DK contract (\d+) a payback of (\d+\.\d+) euro is made on the "(.*?)"$/) do |dk_number, payback, date|
  contract = Contract.find_by_number(dk_number)
  payback = -(payback.to_f)
  contract.accounting_entries.create(amount: payback, date: Date.parse(date))
  p payback
  p contract.balance(Time.now)
end

Then(/^The balance including interest of DK contract (\d+) is (\d+\.\d+) euro$/) do |dk_number, final_balance|
  year = Time.now.year
  contract = Contract.find_by_number(dk_number)
  final_balance = final_balance.to_f
  calculated_balance = contract.balance(year)
  calculated_interest = contract.interest(year).first
  p calculated_balance
  p calculated_interest
  assert_equal final_balance, (calculated_balance + calculated_interest)

end
