require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "No more bikes available" if empty?
    fail "All bikes are broken" if all_broken?
    bikes.delete(find_working_bike)
  end

  def dock(bike)
    fail "Docking Station is full" if full?
    bikes << bike
  end

  def release_broken_to(van)

  end

private

  attr_reader :bikes

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

  def all_broken?
    bikes.all? { |bike| bike.broken? }
  end

  def find_working_bike
    bikes.find { |bike| !bike.broken?}
  end
end
