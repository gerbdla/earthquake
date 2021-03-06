class Earthquake < ApplicationRecord
  include EarthquakeCsv
  RADIUS_IN_MILES = 3956
  RAD_PER_DEG = Math::PI / 180
  LALAT = 34.0522
  LALONG = -118.2437

  def earthquakes_felt(number_of_times, begin_date, end_date)
    file = open_csv

    earthquake_container_hash = {}
    earthquake_container_array = []
    counter = 1
    Earthquake.where("time BETWEEN ? AND ?", begin_date, end_date).where("mag NOT NULL").order("time asc").all.each do |row|
      earthquake_time = row.time

      if earthquake_time.between?(begin_date, end_date)
        distance_from_los_angeles = calculate_distance(LALAT, LALONG, row.latitude.to_i, row.longitude.to_i).to_i

        if distance_from_los_angeles <= (row.mag.round * 100)

          break if counter == number_of_times + 1
          create_record(earthquake_container_hash, row, distance_from_los_angeles, earthquake_container_array)
          earthquake_container_array << earthquake_container_hash
          earthquake_container_hash = {}
          counter = counter + 1
        end
      end
    end

    earthquake_container_array

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

    def create_record(earthquake_container_hash, row, distance, earthquake_container_array)
      earthquake_container_hash["time"] = row.time.strftime("%m.%d.%Y %r")
      earthquake_container_hash["place"] = row.place
      earthquake_container_hash["magnitude"] = row.mag
      earthquake_container_hash["distance_from_los_angeles"] = "#{distance} miles"
      earthquake_container_hash
    end

end
