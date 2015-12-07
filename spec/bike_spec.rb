require 'bike'

describe Bike do

  subject(:bike) { described_class.new }

  describe '#working?' do
    it 'is expected to return true' do
      expect(bike.working?).to be true
    end
  end

end
