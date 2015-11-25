require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  def full?
    @bikes.size >= DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
  end

  private :full?, :empty?
end
