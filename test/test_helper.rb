# encoding: utf-8

require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

require 'minitest/rails/assertions'
require 'minitest/autorun'
require 'minitest/pride'

require 'schema'
require 'models/category'
require 'models/product'

class Minitest::Test
  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym

    if method_defined?(test_name)
      raise "#{test_name} is already defined in #{self}"
    end

    if block_given?
      define_method(test_name, &block)
    else
      define_method(test_name) do
        flunk "No implementation provided for #{name}"
      end
    end
  end
end
