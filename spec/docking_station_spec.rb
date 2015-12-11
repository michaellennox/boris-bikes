require 'docking_station'

describe DockingStation do

  subject(:docking_station) { described_class.new }
  subject(:bike) { double(:bike) }

  it 'should initialize empty' do
    expect(docking_station.bikes).to be_empty
  end

  describe '#release_bike' do
    it 'should release a bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end
  end

  describe '#dock' do
    it 'should dock a bike' do
      docking_station.dock(bike)
      expect(docking_station.bikes).to include bike
    end
  end

end
