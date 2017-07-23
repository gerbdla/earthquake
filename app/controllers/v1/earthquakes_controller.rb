module V1
  class EarthquakesController < ApplicationController

    def earthquake
      @json = JSON.parse(request.body.read)
      puts @json.inspect
      puts @json["earthquakes"]["begin_date"]
      puts @json["earthquakes"]["end_date"]
      earthquake = Earthquake.new

      begin_date = @json["earthquakes"]["begin_date"]
      end_date = @json["earthquakes"]["end_date"]
      number_of_earthquakes = @json["earthquakes"]["number"]

      number_of_days = Date.parse(end_date) - Date.parse(begin_date)
      earthquakes =  earthquake.earthquakes_felt(number_of_earthquakes, number_of_days)
      puts "earthquakes"
      puts earthquakes.inspect

      respond_to do |format|
        format.any(:json, :json) do
          render json: earthquakes.to_json
        end
      end
    end
  end
end
