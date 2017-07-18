require 'csv'
module EarthquakeCsv
  def open_csv()
    csv_text = File.read("all_month.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv
  end
end