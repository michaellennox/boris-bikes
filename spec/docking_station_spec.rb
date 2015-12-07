require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }
  subject(:bike_klass) { double(:bike, new: bike) }
  subject(:bike) { double(:bike) }

  describe '#release_bike' do
    it 'should release a bike' do
      expect(docking_station.release_bike).to eq bike
    end
  end

end
