require 'bike'
describe Bike do

  describe'#initialize' do
    it 'bike working variable should be true when a new bike is created' do
      expect(Bike.new.working).to be true
    end
  end

  describe'#working?' do
    it { is_expected.to respond_to(:working?) }
    it 'should return the value of the working instance variable' do
      expect(subject.working?).to eq subject.working
    end
  end

  describe '#working' do
    it { is_expected.to respond_to(:working) }
    it 'should be editable' do
      subject.working = false
      expect(subject.working).to be false
    end
  end

end
