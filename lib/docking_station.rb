require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if all_broken?
    bikes.delete(bikes.find { |bike| bike.working? })
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  attr_reader :bikes

  def all_broken?
    !bikes.find { |bike| bike.working? }
  end

  def full?
    bikes.size >= capacity
  end

  def empty?
    bikes.empty?
  end

end
