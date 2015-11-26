class Bike
  
  def initialize(broken=false)
    @broken = broken
  end

  def working?
    #functioning = true
    return !@broken
  end

  def report_broken
    @broken = true
  end

end
