describe 'User Stories' do

  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }


  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.
  it 'so someone can use a bike, docking station releases a bike' do
    expect(docking_station.release_bike).not_to raise_error
  end


  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working


end
