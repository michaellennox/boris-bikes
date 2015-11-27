require 'docking_station'

describe DockingStation do

  describe '#release_bike' do

    it 'should release a working bike' do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end

    it "should release the same bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "should raise an error when trying to release a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "The bike is broken"
    end

    it "should raise an error when there are no bikes available" do
      expect{subject.release_bike}.to raise_error "No more bikes available"
    end

  end

  it { is_expected.to respond_to :release_bike }

  it {is_expected.to respond_to :bikes}

  it { is_expected.to respond_to(:dock).with(1).argument }

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
