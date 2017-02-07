require "spec_helper"

RSpec.describe Hamlit::BooleanAttributes do
  describe '.add' do
    it 'modifies Hamlit::AttributeBuilder::BOOLEAN_ATTRIBUTES' do
      original = Hamlit::AttributeBuilder::BOOLEAN_ATTRIBUTES.dup
      Hamlit::BooleanAttributes.add(:hello)
      expect(Hamlit::AttributeBuilder::BOOLEAN_ATTRIBUTES).to eq(original + ['hello'])
    end
  end
end
