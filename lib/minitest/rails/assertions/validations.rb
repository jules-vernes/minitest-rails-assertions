# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Validations
        %w{presence}.each do |validation|
          define_method("assert_validate_#{validation}_of") do |klass, attribute, options|
            raise ArgumentError unless klass.is_a?(ActiveRecord::Base)

            validators = @model.validators_on(@attribute)

            options.each do |key, values|
              validator = validators.detect { |v| v.kind == key.to_sym }

              refute_nil validator, "The association #{key} on #{attribute} is not defined"
              if values.is_a?(Hash)
                values.symbolize_keys!.each do |option, value|
                  assert_includes validator.options, option, "The option #{key} on #{attribute} is not defined"
                  assert_equal validator.options[option], value, "The value of the option #{key} on #{attribute} doesn't match"
                end
              else
                assert_empty validator.options
              end
            end
          end
        end
      end
    end
  end
end
