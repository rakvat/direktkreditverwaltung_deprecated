require 'csv'

class Import

  def self.accounting_entries(file)
    CSV.foreach(file, :headers => true) do |row|
      contract = Contract.where(:number => row.to_hash["contract_id"]).first
      if !contract
        puts "contract for contract_id #{row.to_hash['contract_id']} could not be found"
        next
      end
      entry = AccountingEntry.new
      entry.contract = contract
      entry.amount = row.to_hash["amount"]
      entry.date = row.to_hash["date"]
      entry.save
    end
  end

  def self.contracts(file)
    #CSV: dk_nummer,betrag,zins
    CSV.foreach(file, :headers => true) do |row|
      row = row.to_hash.with_indifferent_access
      interest = row[:zins].chomp('%').to_f/100
      Contract.create_with_balance!(row[:dk_nummer], row[:betrag], interest)
    end
  end

end