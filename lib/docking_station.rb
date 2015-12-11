require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if no_bikes?
    fail 'No working bikes available' if no_working_bikes?
    bikes.pop
  end

  def dock(bike)
    fail 'Cannot dock, station is full' if full?
    bikes << bike
  end

  private

  attr_reader :capacity

  def no_working_bikes?
    !bikes.last.working?
  end

  def no_bikes?
    bikes.empty?
  end

  def full?
    bikes.size >= capacity
  end

end
