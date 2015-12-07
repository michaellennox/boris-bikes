describe 'User Stories' do

  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }


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


  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station


  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked


end
