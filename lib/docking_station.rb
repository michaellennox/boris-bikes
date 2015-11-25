require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No more bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking Station is full" if @bikes.length == 20
    @bikes << bike
  end

end
