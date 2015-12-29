require 'garage'

describe Garage do
  subject(:garage) { described_class.new }
  let(:bike) { double :bike, working?: false }

  it_behaves_like BikeContainer

  describe '#fix_bike' do
    it 'calls fix on the bike' do
      garage.store_bike(bike)
      expect(bike).to receive(:fix)
      garage.fix_bike(bike)
    end
  end
end
