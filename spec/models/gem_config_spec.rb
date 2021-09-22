require "spec_helper"

module Mub
  RSpec.describe GemConfig do
    subject do
      described_class.new.tap do |config|
        config.fk_entities = []
        config.resource_types = ['Foo', 'Bar']
      end
    end

    describe "#validate!" do
      it "Requires fk_entities" do
        subject.fk_entities = nil
        expect { subject.validate! }
          .to raise_error(RuntimeError, /fk_entities/)
      end

      it "Requires resource_types" do
        subject.resource_types = nil
        expect { subject.validate! }
          .to raise_error(RuntimeError, /resource_types/)
      end
    end
  end
end
