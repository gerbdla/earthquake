module V1
  class EarthquakesController < ApplicationController

    def earthquake
      @json = JSON.parse(request.body.read)
      earthquake = Earthquake.new

      begin_date = Date.strptime(@json["earthquakes"]["begin_date"], "%m/%d/%Y")
      end_date = Date.strptime(@json["earthquakes"]["end_date"], "%m/%d/%Y")

      number_of_earthquakes = @json["earthquakes"]["number"]
      number_of_days = TimeDifference.between(begin_date, end_date).in_days

      earthquakes =  earthquake.earthquakes_felt(number_of_earthquakes, number_of_days.to_i)

      respond_to do |format|
        format.any(:json, :json) do
          render json: earthquakes.to_json
        end
      end
    end
  end
end
