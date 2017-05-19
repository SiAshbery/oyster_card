class Journey_log

  attr_reader :list_of_journeys

  def initialize(journey_class)
    @journey_class = journey_class
    @list_of_journeys = [{entry_station: nil, exit_station: nil, fare: nil}]
  end

  def start_journey(entry_station)
    @list_of_journeys[-1][:entry_station] = entry_station
  end

  def end_journey(exit_station)
    @list_of_journeys[-1][:exit_station] = exit_station
  end
end
