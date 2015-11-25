class Bike
  attr_accessor :working
  alias_method :working?, :working

  def initialize
    @working = true
  end

end
