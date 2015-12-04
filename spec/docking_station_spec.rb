require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }

  it { is_expected.to respond_to :release_bike }

end
