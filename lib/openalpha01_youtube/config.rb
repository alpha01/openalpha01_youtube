
require 'yaml'

module OpenAlpha01YouTube
  class Config
    APP_CONFIG = File.join(File.dirname(__FILE__), '../..')
    def self.options
      options_fh = File.new("#{APP_CONFIG}/config/config.yml", 'r')
      options = YAML.load(options_fh.read)
    end
  end
end

