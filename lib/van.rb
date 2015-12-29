require_relative 'bike_container'

class Van
  include BikeContainer

  alias_method :load_bike, :add_bike
  alias_method :unload_broken_bike, :release_broken_bike
  alias_method :unload_working_bike, :release_working_bike
end
