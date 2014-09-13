# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Validations
        OPTIONS = {
               absence: {},
            acceptance: { allow_nil: true, accept: '1' },
            associated: {},
          confirmation: {},
             exclusion: {},
                format: {},
             inclusion: {},
                length: {},
          numericality: {},
              presence: {},
            uniqueness: { case_sensitive: true }
        }


        def assert_associated(subject, attribute, opts = true)
          assert_validates subject, attribute, associated: opts
        end

        OPTIONS.keys.each do |type|
          define_method("assert_#{type}_of") do |subject, attribute, opts = true|
            assert_validates subject, attribute, type => opts
          end
        end

        def assert_validates(subject, attribute, types)
          types.each do |type, opts|
            validators = assert_validator(type, subject, attribute)
            options = OPTIONS[type.to_sym].merge(opts.is_a?(Hash) ? opts : {})
            assert_equal options, validator_options(validators)
          end
        end

        def assert_validator(type, subject, attribute)
          assert_respond_to subject, :validators_on
          validators = validator_of(type.to_sym, subject, attribute)
          refute validators.empty?, "Expected #{subject} has #{type} validator"
          validators
        end

      private

        def validator_of(type, subject, attribute)
          Array(subject.validators_on(attribute).select { |v| v.kind == type })
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
