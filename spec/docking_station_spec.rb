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

    it 'should raise an error if no bike is available' do
      expect{docking_station.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'should dock a bike' do
      docking_station.dock(bike)
      expect(docking_station.bikes).to include bike
    end

    it 'should raise error if trying to dock when station is full' do
      DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(bike)}
      full = 'Cannot dock, station is full'
      expect{docking_station.dock(bike)}.to raise_error full
    end
  end

end
