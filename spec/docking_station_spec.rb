require 'docking_station'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  it_behaves_like BikeContainer

end
