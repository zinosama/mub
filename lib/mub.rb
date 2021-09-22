require "mub/version"
require "mub/engine"

module Mub
  class << self
    def configuration
      @configuration || GemConfig.new
    end

    def configure(validate = true)
      @configuration = GemConfig.new
      yield(@configuration)
      configuration.validate! if validate
    end
  end
end
