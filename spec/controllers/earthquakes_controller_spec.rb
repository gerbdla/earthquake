require 'request_spec_helper'


describe V1::EarthquakesController, :type => :controller do
  describe 'POST #earthquake' do


    it "should return 10 earthquakes between two given dates" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" => {"begin_date" => "07/15/2017", "end_date" => "07/16/2017", "number" => 10}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)

      expect(json.count).to eq(10)
    end

    it "should return time, place, magnitude and distance from los angeles" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" =>{"begin_date" => "7/15/2017", "end_date" => "7/16/2017", "number" => 10}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)
      expect(json.count).to eq(10)
      expect(json[0]["time"]).to eq( "07.15.2017 12:57:49 AM")
      expect(json[0]["place"]).to eq("17km SW of Oasis, CA")
      expect(json[0]["distance_from_los_angeles"]).to eq("148 miles")
      expect(json[0]["magnitude"]).to eq(2.3)
    end


    it "should return earthquakes within a 30 day period if no dates are supplied" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" => {"begin_date" => "07/01/2017", "end_date" => "07/24/2017", "number" => 10}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)

      expect(json.count).to eq(10)
      expect(json[0]["time"]).to eq("07.01.2017 04:22:50 AM")
      expect(json[0]["place"]).to eq("29km E of King City, California")
      expect(json[0]["distance_from_los_angeles"]).to eq("167 miles")
      expect(json[0]["magnitude"]).to eq(2.39)

    end

    it "should return 10 earthquakes in the last 30 days" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" => {"begin_date" => "", "end_date" => "", "number" => 10}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)

      expect(json.count).to eq(10)
      expect(json[0]["time"]).to eq("07.11.2017 12:23:34 AM")
      expect(json[0]["place"]).to eq( "2km ESE of Loma Linda, CA")
      expect(json[0]["distance_from_los_angeles"]).to eq("71 miles")
      expect(json[0]["magnitude"]).to eq(1.21)

    end

  end
end

