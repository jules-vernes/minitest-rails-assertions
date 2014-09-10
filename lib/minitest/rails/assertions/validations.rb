# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Validations
        OPTIONS = {
          uniqueness: { case_sensitive: true }
        }.tap { |hsh| hsh.default_proc = lambda { |h, k| h[k] = Hash.new } }

        %w{presence uniqueness}.each do |type|
          method_name = "assert_#{type}_of"
          define_method(method_name) do |klass, attribute, opts = {}, msg = nil|
            assert_validates type, klass, attribute, opts, msg
          end
        end

        def assert_validates(type, klass, attribute, opts = {}, msg = nil)
          validators = assert_validator(type, klass, attribute)
          options = OPTIONS[type.to_sym].merge(opts.to_h)
          assert_equal options, validator_options(validators), msg
        end

        def assert_validator(type, klass, attribute)
          assert_respond_to klass, :validators_on
          validators = validator_of(type.to_sym, klass, attribute)
          refute validators.empty?, "Expected (#{klass}) has #{type} validator"
          validators
        end

      private

        def validator_of(type, klass, attribute)
          Array(klass.validators_on(attribute).select { |v| v.kind == type })
        end

        def validator_options(validators)
          validator_options = validators.each_with_object({}) do |v, hash|
            hash.merge!(v.options)
          end
        end
      end
    end
  end
end
