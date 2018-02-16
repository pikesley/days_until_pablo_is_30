module DaysUntilPabloIs30
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def days
      (DateTime.parse('2018-07-26') - DateTime.now).to_i
    end
  end
end
