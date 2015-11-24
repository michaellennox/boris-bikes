require 'docking_station'
require 'bike'

describe DockingStation do
  describe '#initialize' do
    it 'initializes the docking station with an empty array of bikes' do
      expect(DockingStation.new.bikes).to eq([])
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }
    it 'releases a working bike if a bike is present' do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end
    it 'raises an error if no bike available' do
      expect { subject.release_bike }.to raise_error('No bike available!')
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument}
    it 'accepts a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq([bike])
    end
    it 'does not accept a bike if it is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error('Docking station is full!')
    end
  end

  it { is_expected.to respond_to(:bikes) }

end
