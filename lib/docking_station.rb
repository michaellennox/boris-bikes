require_relative 'bike_container'

class DockingStation
  include BikeContainer

  alias_method :dock, :add_bike
end
