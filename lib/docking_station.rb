require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if bikes.empty?
    bikes.pop
  end

  def dock(bike)
    raise 'Docking station full' if bikes.size > 0
    @bikes << bike
  end

end
