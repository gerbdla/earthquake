include EarthquakeCsv
Earthquake.delete_all
file = open_csv
file.each do |row|
  earthquake = Earthquake.new
  earthquake.time = row["time"]
  earthquake.latitude = row["latitude"]
  earthquake.longitude =row["longitude"]
  earthquake.depth = row["depth"]
  earthquake.mag = row["mag"]
  earthquake.mag_type = row["mag_type"]
  earthquake.nst = row["nst"]
  earthquake.gap =row["gap"]
  earthquake.dmin = row["dmin"]
  earthquake.rms = row["rms"]
  earthquake.net = row["net"]
  earthquake.earthquake_id = row["earthquake_id"]
  earthquake.updated = row["updated"]
  earthquake.place = row["place"]
  earthquake.earthquake_type = row["type"]
  earthquake.horizontal_error = row["horrizontal_error"]
  earthquake.depth_error = row["depth_error"]
  earthquake.mag_error = row["mag_error"]
  earthquake.mag_nst = row["mag_nst"]
  earthquake.status = row["status"]
  earthquake.location_source = row["location_source"]
  earthquake.mag_source = row["mag_source"]
  earthquake.save
end