require 'hamlit'
require 'hamlit/boolean_attributes/version'

module Hamlit
  module BooleanAttributes
    # Changing Hamlit::AttributeBuilder::BOOLEAN_ATTRIBUTES to a instance/class method
    # will cause performance regression because it requires rb_funcall.
    # So directly modifying constant.
    def self.add(attribute)
      original = Hamlit::AttributeBuilder::BOOLEAN_ATTRIBUTES.dup
      original << attribute.to_s
      Hamlit::AttributeBuilder.class_eval do
        remove_const('BOOLEAN_ATTRIBUTES')
        const_set('BOOLEAN_ATTRIBUTES', original.uniq.freeze)
      end
    end
  end
end
