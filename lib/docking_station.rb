require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bike available!" unless @bikes
    @bikes
  end

  def dock(bike)
    raise "Docking station is full!" if @bikes
    @bikes = bike
  end

end
