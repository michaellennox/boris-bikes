require 'docking_station'

describe DockingStation do

  describe '#initialize' do
    it 'should initialize with bikes set to an empty array' do
      expect(subject.bikes).to eq([])
    end

    it 'sets capacity to argument passed' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq(30)
    end


  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity)}
  end

  describe '#dock' do

    it 'raises an error if 20 bikes are already docked' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error('Docking station full')
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

  end

  describe '#bikes' do

    it { is_expected.to respond_to(:bikes) }

  end

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it  'raises an error if there are no bikes' do
      expect{subject.release_bike}.to raise_error('No bikes available')
    end

    it 'releases working bikes' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end

  end

end
