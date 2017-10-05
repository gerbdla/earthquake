module V1
  class EarthquakesController < ApplicationController

    def earthquake

      earthquake = Earthquake.new

      #no data was sent so set the date to a month back from today
      if params["begin_date"].blank? or params["end_date"].blank?
        begin_date = (Date.today - 30.days)
        end_date = Date.today
      else
        begin_date = Date.strptime(params["begin_date"], "%m/%d/%Y")
        end_date = Date.strptime(params["end_date"], "%m/%d/%Y")
      end

      number_of_earthquakes = params["number"].to_i

      earthquakes =  earthquake.earthquakes_felt(number_of_earthquakes, begin_date, end_date)


      puts "here"
      puts number_of_earthquakes
      puts begin_date
      puts end_date
      render json: earthquakes

    end
  end
end
