namespace :slurp do
  desc "TODO"
  task transactions: :environment do

    require "csv"
    csv_text = File.read(Rails.root.join("lib","csvs", "models.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
    DroneInfo.create!(row.to_hash)
    end

  end

end
