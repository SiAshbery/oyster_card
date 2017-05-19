class Journey_log

  attr_reader :current_journey

  def initialize(entry_station, exit_station)
    @current_journey = {entry_station: entry_station, exit_station: exit_station, fare: nil}
  end

end
