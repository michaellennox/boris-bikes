require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument}
  it { is_expected.to respond_to(:bikes) }
  it 'accepts a bike' do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.bikes).to eq(bike)
  end
end
