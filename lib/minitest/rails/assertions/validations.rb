# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Validations
        OPTIONS = {
          uniqueness: { case_sensitive: true }
        }

        %w{presence uniqueness}.each do |type|
          method_name = "assert_#{type}_of"
          define_method(method_name) do |klass, attribute, opts = {}, msg = nil|
            send(:assert_validates, type, klass, attribute, opts, msg)
          end
        end

        def assert_validates(type, klass, attribute, opts = {}, msg = nil)
          validator = assert_validator(type, klass, attribute)
          options = opts.to_h.merge(OPTIONS[type.to_sym])
          assert_equal options, validator_options(validator), msg
        end

        def assert_validator(type, klass, attribute)
          assert_respond_to klass, :validators_on
          validator = validator_of(type.to_sym, klass, attribute)
          refute validator.empty?, "Expected (#{klass}) has #{type} validator"
          validator
        end

      private

        def validator_of(type, klass, attribute)
          Array(klass.validators_on(attribute).select { |v| v.kind == type })
        end

        def validator_options(validator)
          validator_options = validator.each_with_object({}) do |v, hash|
            hash.merge!(v.options)
          end
        end
      end
    end
  end
end
