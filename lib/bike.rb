class Bike
  attr_reader :working
  alias_method :working?, :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end

end
