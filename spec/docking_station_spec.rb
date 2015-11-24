require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'releases a working bike' do
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
    expect { subject.bikes }.to raise_error('No bike available!')
  end
end
