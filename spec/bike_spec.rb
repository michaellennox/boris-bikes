require 'bike'

describe Bike do

  describe '#report_broken' do

    it "should check the broken bike report has been issued" do
      expect(subject.report_broken).to be true
    end

  end

end
