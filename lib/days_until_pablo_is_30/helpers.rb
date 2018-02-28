module DaysUntilPabloIs30
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def days end_date = CONFIG['birthday'].to_s
      (DateTime.parse(end_date) - DateTime.now).ceil
    end
  end
end
