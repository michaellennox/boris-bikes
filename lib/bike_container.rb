module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_working_bike
    fail 'No bikes available' if no_bikes?
    fail 'No working bikes available' if no_working_bikes?
    bikes.delete(find_working_bike)
  end

  def release_broken_bike
    fail 'No bikes available' if no_bikes?
    fail 'No broken bikes available' if no_broken_bikes?
    bikes.delete(find_broken_bike)
  end

  def add_bike(bike)
    fail "Cannot add bike, #{self.class.name} is full" if full?
    bike.working? ? bikes << bike : bikes.unshift(bike)
  end

  private

  attr_reader :capacity

  def no_working_bikes?
    !(bikes.find { |bike| bike.working? })
  end

  def no_broken_bikes?
    !(bikes.find { |bike| !bike.working? })
  end

  def no_bikes?
    bikes.empty?
  end

  def full?
    bikes.size >= capacity
  end

  def find_working_bike
    bikes.find { |bike| bike.working? }
  end

  def find_broken_bike
    bikes.find { |bike| !bike.working? }
  end

end
