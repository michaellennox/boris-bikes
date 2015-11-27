require 'docking_station'

describe DockingStation do

  it "should change capacity when given an argument" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end

  it "should equal the default capacity when no argument is given" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to :bikes}

  describe '#release_bike' do

    it 'should release a working bike if any present' do
      subject.dock(Bike.new)
      brokenbike = Bike.new
      brokenbike.report_broken
      subject.dock(brokenbike)
      bike = subject.release_bike
      expect(bike.broken?).to be_falsey
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

    it "should raise an error when trying to remove a bike from an empty station" do
      expect{subject.release_bike}.to raise_error "No more bikes available"
    end

  end

  describe '#dock' do

    it "should raise an error when trying to dock more bikes than the capacity" do
      subject.capacity.times{subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error "Docking Station is full"
    end

  end

end
