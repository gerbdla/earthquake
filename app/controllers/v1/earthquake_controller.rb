module V1
  class WordsController < ApplicationController

    def earthquake
      @json = JSON.parse(request.body.read)

      earthquake = Earthquake.new

      begin_date = @json[:begin_date]
      end_date = @json[:end_date]

      number_of_days = end_date - begin_date
      earthquakes =  earthquake.earthquakes_felt(10, number_of_days)

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "Words Added!"
        end
      end
    end
  end
end
