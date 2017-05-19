require "journey_log"

describe Journey_log do
subject(:journey_log) {described_class.new(:entry_station, :exit_station)}


  describe "#initialize" do
    it "returns a journey when initialized" do
      expect(journey_log.current_journey).to eq( entry_station: :entry_station, exit_station: :exit_station, fare: nil )
    end
  end

  describe "#start_journey" do
    
  end

  describe "#end_journey" do

  end
end
