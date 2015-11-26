class Bike
  attr_accessor :functioning

  def initialize(functioning=true)
    @functioning = functioning
  end

  def working?
    #functioning = true
    return @functioning
  end

  def report_broken
    @functioning = false
  end

end
