require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if no_bikes_available?
    bikes.pop
  end

  def dock(bike)
    fail 'Cannot dock, station is full' if docking_station_full?
    bikes << bike
  end

  private

  def no_bikes_available?
    @bikes.empty?
  end

  def docking_station_full?
    @bikes.size >= DEFAULT_CAPACITY
  end

end
