require_relative 'bike_container'

class Garage
  include BikeContainer

  alias_method :store_bike, :add_bike
end
