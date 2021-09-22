module Mub
  class GemConfig
    REQUIRED_SETTINGS = %i[
      fk_entities
      resource_types
    ].freeze

    attr_accessor :fk_entities, :resource_types

    def validate!
      REQUIRED_SETTINGS.each do |setting|
        raise "Missing required setting - #{setting}" unless public_send(setting)
      end
    end
  end
end
