require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = 0
  end

  def release_bike
    if @bikes == 0
      raise "No bike available!"
    end
    Bike.new
  end

  def dock(bike)
    @bikes = bike
  end

end
