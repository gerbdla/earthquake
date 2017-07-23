require 'request_spec_helper'


describe V1::EarthquakesController, :type => :controller do
  describe 'POST #earthquake' do

    it "it should return 5 earthquakes" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" => {"begin_date" => "01/01/2001", "end_date" => "10/11/2010", "number" => 5}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)

      expect(json.count).to eq(5)
    end

    it "it should return 10 earthquakes" do
      request.env["HTTP_ACCEPT"] = 'application/json'

      @request.env['CONTENT_TYPE'] = 'application/json'
      @request_json = {"earthquakes" => {"begin_date" => "01/01/2001", "end_date" => "10/11/2010", "number" => 10}}

      post :earthquake, params: @request_json

      json = JSON.parse(response.body)

      expect(json.count).to eq(10)
    end

    # it "it return the number of earthquakes within a timeframe" do
    #   request.env["HTTP_ACCEPT"] = 'application/json'
    #
    #   @request.env['CONTENT_TYPE'] = 'application/json'
    #   @request_json = {"earthquakes" => {"begin_date" => "7/14/2017", "end_date" => "7/15/2017", "number" => 10}}
    #
    #   post :earthquake, params: @request_json
    #
    #   json = JSON.parse(response.body)
    #   puts json
    #   puts json[1][:time]
    #
    #   expect(json.count).to eq(2)
    #   expect(json[1]["time"]).to eq("2017-07-16T19:32:57.310Z")
    #
    # end

  end
end

