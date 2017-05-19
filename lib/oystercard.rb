require_relative 'journey'
require_relative 'station'
class Oystercard

  attr_reader :balance, :entry_station, :journey_log

  Maximum_balance = 90

  def initialize
    @balance = 0
    reset_stations
    @journey_log = []
  end
#hello
  def top_up(amount)
    fail "Cannot top up above £#{Maximum_balance}" if amount + @balance > Maximum_balance
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < Journey::Minimum_fare
    record_journey if in_journey?
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    record_journey
  end

private

  def record_journey
    @journey_log << Journey.new(@entry_station, @exit_station).log
    reset_stations
    deduct_fare
  end

  def deduct_fare
    @balance -= @journey_log[-1][:fare]
  end

  def in_journey?
    @entry_station != nil
  end

  def reset_stations
    @entry_station = nil
    @exit_station = nil
  end

end
