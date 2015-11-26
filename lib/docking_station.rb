require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "No more bikes available" if empty?
    fail "The bike is broken" if @bikes.last.working? == false
    @bikes.pop
  end

  def dock(bike)
    fail "Docking Station is full" if full?
    @bikes << bike
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
