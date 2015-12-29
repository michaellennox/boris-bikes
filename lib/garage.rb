require_relative 'bike_container'

class Garage
  include BikeContainer

  alias_method :store_bike, :add_bike

  def fix_bike(bike)
    bike.fix
  end
end
