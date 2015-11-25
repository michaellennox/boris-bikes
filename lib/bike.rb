class Bike
  attr_reader :working
  alias_method :working?, :working

  def working=(arg)
    fail 'have to be a bool' unless !!arg == arg
    @working = arg
  end

  def initialize
    @working = true
  end
end
