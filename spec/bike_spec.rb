require 'bike'
describe Bike do

  describe '#working?' do
    it { is_expected.to respond_to :working?}
  end

  describe '#report_broken' do
    it { is_expected.to respond_to :report_broken }

    it 'when reported broken it assigns false to the working? variable' do
      subject.report_broken
      expect(subject.working?).to eq(false)
    end
  end

end
