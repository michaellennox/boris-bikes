describe 'User Stories' do

  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  context 'after a bike is docked' do
    before(:example) do
      docking_station.dock(bike)
    end

    # As a person,
    # So that I can use a bike,
    # I'd like a docking station to release a bike.
    it 'so someone can use a bike, docking station releases a bike' do
      expect(docking_station.release_bike).to be_a Bike
    end

    # As a person,
    # So that I can use a good bike,
    # I'd like to see if a bike is working
    it 'so I can use a good bike, I\'d like to check the bike is working' do
      expect(docking_station.release_bike).to be_working
    end
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station
  it 'so I can return a bike, I want to dock my bike at the station' do
    expect{docking_station.dock(bike)}.not_to raise_error
  end

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  it 'so I can return a bike, I want to dock my bike at the station' do
    docking_station.dock(bike)
    expect(docking_station.bikes).to include bike
  end

  # As a member of the public,
  # So that I am not confused and charged unnecessarily,
  # I'd like docking stations not to release bikes when there are none available
  it 'an empty docking station should not release a bike' do
    expect{docking_station.release_bike}.to raise_error 'No bikes available'
  end

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity.
  it 'a docking station should not accept more bikes than capacity' do
    20.times { docking_station.dock(Bike.new) }
    expect{docking_station.dock(bike)}.to raise_error 'Cannot dock, station is full'
  end

end
