require_relative 'station'

class Journey

  Minimum_fare = 1
  Penalty_fare = 6

  attr_accessor :log, :entry_station, :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @log = {entry_station: entry_station, exit_station: exit_station, fare: Minimum_fare}
  end

  def calculate_fare(entry_station, exit_station)
     incomplete_journey?(entry_station, exit_station) ? Penalty_fare : Minimum_fare
    end

private
    def incomplete_journey?(entry_station, exit_station)
      entry_station  == nil || exit_station == nil
    end
  end
