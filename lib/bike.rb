class Bike

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
    true
  end

=begin
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
=end
end
