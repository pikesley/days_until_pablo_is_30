class TestHelper
  include DaysUntilPabloIs30::Helpers
end

module DaysUntilPabloIs30
  describe Helpers do
    it 'has a config' do
      expect(CONFIG).to be_a Hash
    end
  end
end
