require 'garage'

describe Garage do
  subject(:garage) { described_class.new }

  it 'should initialize empty' do
    expect(garage.bikes).to be_empty
  end
end
