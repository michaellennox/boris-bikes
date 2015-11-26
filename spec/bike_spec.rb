require 'bike'
describe Bike do

  it { is_expected.to respond_to :working?}

  describe '#report_broken' do

    it 'should assign false to the working? variable' do
      subject.report_broken
      expect(subject.working?).to eq(false)
    end

  end

end
