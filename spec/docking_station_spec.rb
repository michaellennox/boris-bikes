require 'docking_station'

describe DockingStation do

  describe '#capacity' do
    it { is_expected.to respond_to :capacity }
  end

  describe '#initialize' do
    it 'Should give capacity a default value of DockingStation::DEFAULT_CAPACITY' do
      station = DockingStation.new
      expect(station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
    it 'Should accept an argument and give capacity the value passed as an argument' do
      station = DockingStation.new 50
      expect(station.capacity).to eq(50)
    end
  end

  describe '#bikes' do
    it { is_expected.to respond_to(:bikes) }
    it 'should return an array with the bikes in the docking station' do
      array = []
      2.times { bike = Bike.new; array << bike; subject.dock(bike) }
      expect(subject.bikes).to match_array(array)
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes
    end
    it 'raises an error when trying to add more bikes than capacity' do
      station = DockingStation.new(40)
      station.capacity.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error 'Docking station is full'
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock_and_report' do
    it { is_expected.to respond_to(:dock_and_report).with(1).argument }
  end

end
