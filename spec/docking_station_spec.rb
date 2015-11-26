require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'to get bike out and working' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it {is_expected.to respond_to :bikes}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "returns same bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it "does not release broken bike" do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error "The bike is broken"
  end

  it "no_bike_available" do
    expect {subject.release_bike}.to raise_error "No more bikes available"
  end

  it "Docking Station is full" do
    subject.capacity.times{subject.dock(Bike.new)}
    expect { subject.dock(Bike.new) }.to raise_error "Docking Station is full"
  end

  it "Changes capacity when given an argument" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end

  it "No capacity given" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "returning broken bike" do
    bike = Bike.new
    bike.working? == false
  end
end
