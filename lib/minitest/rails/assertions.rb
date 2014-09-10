require 'minitest/test'
require 'minitest/rails/assertions/validations'
require 'minitest/rails/assertions/version'

module Minitest
  class Test
    include ::Minitest::Rails::Assertions::Validations
  end
end
