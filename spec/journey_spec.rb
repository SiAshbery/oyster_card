require 'journey'
#hello
describe Journey do

  subject(:journey) { described_class.new(:mornington_cresent, :shadwell) }

    describe '#initialize' do

      it 'Initilizes with the journy object populated by the passed arguements' do
        expect(journey.log).to eq(:entry_station => :mornington_cresent, :exit_station => :shadwell, :fare => 1)
      end
    end
    describe '#calculate_fare' do
      it "charges the Minimum_fare by default" do
        expect(journey.log[:fare]).to eq journey.class::Minimum_fare
      end
      it "charges the Penalty_fare when there is no entry station logged" do
        journey = Journey.new(nil, :shadwell)
        expect(journey.log[:fare]).to eq journey.class::Penalty_fare
      end
        it "charges the Penalty_fare when there is no exit station logged" do
        journey = Journey.new(:mornington_cresent, nil)
        expect(journey.log[:fare]).to eq journey.class::Penalty_fare
      end
    end
  end
