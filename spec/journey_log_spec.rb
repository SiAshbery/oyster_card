require "journey_log"

describe Journey_log do
subject(:journey_log) {described_class.new(:journey)}


  describe "#start_journey" do
    it "returns a journey when initialized" do
      expect(journey_log.current_journey).to eq( entry_station: :entry_station, exit_station: nil, fare: nil )
    end
  end

  describe "#end_journey" do

  end
end
