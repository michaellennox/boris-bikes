require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'to get bike out and working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to :bike_available}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "returns same bike" do
    station = DockingStation.new
    bike = station.release_bike
    station.dock(bike)
    expect(station.bike_available).to eq(bike)
  end

  #testing
  
end
