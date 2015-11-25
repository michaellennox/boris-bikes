require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def full?
    bikes.size >= capacity
  end

  def empty?
    bikes.empty?
  end

  def broken_only?
    !bikes.find{ |bike| bike.working }
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes are available' if broken_only?
    bikes.delete(bikes.find{ |bike| bike.working })
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    bikes << bike
  end

  def dock_and_report(bike)
    bike.working = false
    dock(bike)
  end

  private :full?, :empty?, :broken_only?
end
