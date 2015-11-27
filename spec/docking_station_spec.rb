require 'docking_station'

describe DockingStation do

  it "should change capacity when given an argument" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end

  it "should equal the default capacity when no argument is given" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do

    it 'should release a working bike if any present' do
      subject.dock(double(:bike, broken?:nil))
      subject.dock(double(:bike, broken?:true))
      bike = subject.release_bike
      expect(bike.broken?).to be_falsey
    end

    it 'should check the bike has been released' do
      subject.dock(double(:bike, broken?:nil))
      subject.release_bike
      expect{subject.release_bike}.to raise_error "No more bikes available"
    end

    it "should release the same bike as removed" do
      bike = double(:bike, broken?:nil)
      subject.dock(bike)
      brokenbike = double(:bike)
      allow(brokenbike).to receive(:broken?).and_return(true)
      subject.dock(brokenbike)
      expect(subject.release_bike).to eq(bike)
    end

    it "should raise an error when trying to release a broken bike" do
      bike = double(:bike, broken?:true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "All bikes are broken"
    end

    it "should raise an error when trying to remove a bike from an empty station" do
      expect{subject.release_bike}.to raise_error "No more bikes available"
    end

  end

  describe '#dock' do

    it "should raise an error when trying to dock more bikes than the capacity" do
      subject.capacity.times{subject.dock(double(:bike))}
      expect { subject.dock(double(:bike)) }.to raise_error "Docking Station is full"
    end

  end

end
