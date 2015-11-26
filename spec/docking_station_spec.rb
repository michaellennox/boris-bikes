require 'docking_station'

describe DockingStation do

  describe '#dock' do

    it 'raises an error if bike is already docked' do
      subject.dock(Bike.new)
      expect{subject.dock(Bike.new)}.to raise_error('Docking station full')
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

  end

  describe '#bike' do

    it { is_expected.to respond_to(:bike) }

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
