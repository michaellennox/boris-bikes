shared_examples_for BikeContainer do
  subject(:bike_container) { described_class.new }
  let(:bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }

  it 'should initialize empty' do
    expect(subject.bikes).to be_empty
  end

  describe '#release_working_bike' do
    it 'should release a bike' do
      bike_container.add_bike(bike)
      expect(bike_container.release_working_bike).to eq bike
    end

    it 'should raise an error if no bike is available' do
      expect{bike_container.release_working_bike}.to raise_error 'No bikes available'
    end

    it 'should raise an error if no working bikes are available' do
      bike_container.add_bike(broken_bike)
      no_bikes = 'No working bikes available'
      expect{bike_container.release_working_bike}.to raise_error no_bikes
    end
  end

  describe '#add_bike' do
    it 'should add a bike' do
      bike_container.add_bike(bike)
      expect(bike_container.bikes).to include bike
    end

    it 'should raise error if trying to add_bike when station is full' do
      BikeContainer::DEFAULT_CAPACITY.times {bike_container.add_bike(bike)}
      full = "Cannot add bike, #{described_class.name} is full"
      expect{bike_container.add_bike(bike)}.to raise_error full
    end
  end

  describe '#release_broken_bike' do
    it 'should release a broken bike' do
      bike_container.add_bike(broken_bike)
      expect(bike_container.release_broken_bike).to eq broken_bike
    end

    it 'should raise an error if no bike is available' do
      expect{bike_container.release_broken_bike}.to raise_error 'No bikes available'
    end

    it 'should raise an error if no broken bikes are available' do
      bike_container.add_bike(bike)
      no_bikes = 'No broken bikes available'
      expect{bike_container.release_broken_bike}.to raise_error no_bikes
    end
  end

end
