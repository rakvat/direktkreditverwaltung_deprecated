require 'csv'

namespace :import do
  desc "import contacts from csv file"
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
end




