require 'bike'

class DockingStation

  attr_reader :bike_klass

  def initialize(bike_klass: Bike)
    @bike_klass = bike_klass
  end

  def release_bike
    bike_klass.new
  end

end
