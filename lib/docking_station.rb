require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def release_bike
    raise "No bike available!" unless @bikes
    @bikes
  end

  def dock(bike)
    @bikes = bike
  end

end
