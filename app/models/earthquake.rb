class Earthquake

  include EarthquakeCsv
  RADIUS_IN_MILES = 3956
  RAD_PER_DEG = Math::PI / 180
  LALAT = 34.0522
  LALONG = -118.2437

  def earthquakes_felt(number_of_cities, number_of_days=30)
    file = open_csv

    file.each do |row|
      num_of_days = (Date.today - Date.parse(row["time"])).round

      if num_of_days <= number_of_days
        puts calculate_distance(LALAT, LALONG, row["latitude"].to_i, row["longitude"].to_i)
      end
    end
  end

  def calculate_distance(*coordinates)
    # Accept two arrays of points in addition to four coordinatesß
    lat1, lon1, lat2, lon2 = Array(coordinates).flatten
    raise ArgumentError if [lat1, lon1, lat2, lon2].include? nil

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    a = calc_a(dlat, lat1, lat2, dlon)

    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))


    RADIUS_IN_MILES * c


  end


  private
  
    def calc_a(dlat, lat1, lat2, dlon)
      (Math.sin(rpd(dlat)/2))**2 + Math.cos(rpd(lat1)) * Math.cos((rpd(lat2))) * (Math.sin(rpd(dlon)/2))**2
    end


    def rpd(num)
      num * RAD_PER_DEG
    end


end
