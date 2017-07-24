require 'request_spec_helper'

describe Earthquake, :type => :model do
  describe 'caluculate_distance' do

    it "should return distance" do
      earthquake = Earthquake.new
      test = earthquake.calculate_distance(34.0522, -118.2437, 61.1995, -147.3478).round
      puts test
      expect(test).to eq(2273)
    end
  end

end