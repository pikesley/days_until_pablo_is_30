class TestHelper
  include DaysUntilPabloIs30::Helpers
end

module DaysUntilPabloIs30
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'has a config' do
      expect(CONFIG).to be_a Hash
    end

    it 'knows how many days are left' do
      Timecop.freeze DateTime.parse '2018-02-16T12:00:00' do
        expect(helpers.days).to eq 159
      end
    end
  end
end
