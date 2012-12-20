require 'csv'

namespace :import do
  desc "import contacts from csv file"
  #column headers should be: name prename address account_number bank_number
  task :contacts, [:file] => :environment do |t, args|
    file = args[:file]
    if !file
      puts "parameter 'file' needs to be given" 
      next 
    end
    CSV.foreach(file, :headers => true) do |row|
      Contact.create!(row.to_hash)
    end
  end

  desc "import accounting_entries from csv file"
  #column headers should be: date amount contract_id
  #format of date should be YYYY-MM-DD
  task :accounting_entries, [:file] => :environment do |t, args|
    file = args[:file]
    if !file
      puts "parameter 'file' needs to be given" 
      next 
    end
    CSV.foreach(file, :headers => true) do |row|
      contract = Contract.where(:number => row.to_hash["contract_id"]).first
      if !contract
        puts "contract for contract_id #{row.to_hash[:contract_id]} could nod be found"
        next
      end
      entry = AccountingEntry.new
      entry.contract = contract
      entry.amount = row.to_hash["amount"]
      entry.date = row.to_hash["date"]
      entry.save
    end
  end
end




