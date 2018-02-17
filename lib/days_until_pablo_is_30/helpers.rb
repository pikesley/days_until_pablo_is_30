module DaysUntilPabloIs30
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def days
    (DateTime.parse(CONFIG['birthday'].to_s) - DateTime.now).to_i
    end
  end
end
