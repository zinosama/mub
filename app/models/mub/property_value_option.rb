module Mub
  class PropertyValueOption
    attr_reader :name, :value
    def initialize(name:, value:)
      @name, @value = name, value
    end

    # To meet json:api serialization requirement on id
    def id
      SecureRandom.uuid
    end
  end
end
