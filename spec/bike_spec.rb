require 'bike'
describe Bike do

  describe '#working?' do
    it { is_expected.to respond_to :working?}
  end

  describe '#report_broken' do
    it { is_expected.to respond_to :report_broken }
  end

end
