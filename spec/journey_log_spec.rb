require "journey_log"

describe Journey_log do
let(:journey_class) {double(:fake_journey_class)}
subject(:journey_log) {described_class.new(journey_class)}


  describe "#initialize" do
    it "returns a journey when initialized" do
      expect(journey_log.list_of_journeys).to eq([{entry_station: nil, exit_station: nil, fare: nil}])
    end
  end

  describe "#start_journey" do
    it "will update the current journey with the entry station" do
      journey_log.start_journey(:entry_station)
      expect(journey_log.list_of_journeys[-1][:entry_station]).to eq(:entry_station)
  end
end

  describe "#end_journey" do
    it "will update the current journey with the exit station" do
      journey_log.end_journey(:exit_station)
        expect(journey_log.list_of_journeys[-1][:exit_station]).to eq(:exit_station)
    end
  end
end
