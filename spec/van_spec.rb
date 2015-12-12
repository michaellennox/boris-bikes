require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:docking_station) { double :docking_station }
  let(:bike) { double :bike, working?: true }
  let(:broken_bike) { double :bike, working?: false }

  it 'should initialize empty' do
    expect(van.bikes).to be_empty
  end
end
