require 'garage'

describe Garage do
  subject(:garage) { described_class.new }

  it_behaves_like BikeContainer
end
