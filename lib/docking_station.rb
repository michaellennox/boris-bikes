require 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if no_bikes_available?
    bikes.pop
  end

  def dock(bike)
    bikes << bike
  end

  private

  def no_bikes_available?
    @bikes.empty?
  end

end
