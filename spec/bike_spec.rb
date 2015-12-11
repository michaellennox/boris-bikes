require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe '#working?' do
    it 'is expected to return true upon initialization' do
      expect(bike.working?).to be true
    end
  end

  describe '#report_broken' do
    it 'is expected to change the status of working? to false' do
      bike.report_broken
      expect(bike.working?).to be false
    end
  end

end
