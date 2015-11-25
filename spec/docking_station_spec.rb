require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'to get bike out and working' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to :bike_available}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "returns same bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike_available).to eq(bike)
  end
  it "no_bike_available" do
    expect {subject.release_bike}.to raise_error "No more bikes available"
  end

  it "Docking Station is full" do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike) }.to raise_error "Docking Station is full"
  end

end
