require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'releases a working bike if a bike is present' do
    bike1 = Bike.new
    subject.dock(bike1)
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument}
  it { is_expected.to respond_to(:bikes) }
  it 'accepts a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq(bike)
  end
  it 'raises an error if no bike available' do
    station = DockingStation.new
    expect { station.release_bike }.to raise_error('No bike available!')
  end
end
