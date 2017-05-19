require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
#hello
  describe '#balance' do
    it "returns a value for the balance" do
      expect(oystercard.balance).to eq 0
    end

    it "Increases the balance when top_up is called" do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it "errors if a maximum balance is reached" do
      expect{ oystercard.top_up(91) }.to raise_error "Cannot top up above £#{oystercard.class::Maximum_balance}"
    end

    it "Decreases the balance when a journey is complete" do
      oystercard.top_up(5)
      oystercard.touch_in(:mornington_cresent)
      expect{oystercard.touch_out(:shadwell)}.to change{ oystercard.balance }.by -1
    end
  end

  let(:station) { double(:station) }

  describe '#Touch in' do
    it "charges a penalty fare if already touched in" do
      oystercard.top_up(6)
      2.times { oystercard.touch_in(:mornington_cresent) }
      expect(oystercard.balance).to eq 0
    end
    it "Will not allow a user to touch in when card balance is below minimum fare" do
      expect{ oystercard.touch_in(:station) }.to raise_error "Insufficient funds"
    end
    it 'tells you where you have touched in' do
      oystercard.top_up(5)
      oystercard.touch_in(:station)
      expect(oystercard.entry_station).to eq :station
    end
    it "Clears the entry_station on touch_out" do
      oystercard.top_up(5)
      oystercard.touch_in(:station)
      oystercard.touch_out(Journey::Minimum_fare)
      expect(oystercard.entry_station).to eq nil
    end
    it "Return a log of our journeys" do
      oystercard.top_up(10)
        oystercard.touch_in(:entry_station)
        oystercard.touch_out(:exit_station)
      expect(oystercard.journey_log).to eq [{entry_station: :entry_station, exit_station: :exit_station, fare: 1}]
      end
    end
  end
