require 'van'

describe Van do
  subject(:van) { described_class.new }

  it_behaves_like BikeContainer
end
