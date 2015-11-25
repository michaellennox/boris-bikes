require_relative 'bike'

class DockingStation
  attr_reader :bike_available

  def release_bike
    fail "No more bikes available" unless @bike_available
    Bike.new
  end

  def dock(bike)
    @bike_available = bike
  end
end
