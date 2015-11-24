require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available!" unless @bikes.size == 1
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full!" if @bikes.size == 20
    @bikes << bike
  end

end
