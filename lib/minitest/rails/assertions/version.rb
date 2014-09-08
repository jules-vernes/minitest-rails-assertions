# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Version
        MAJOR = 0
        MINOR = 0
        TINY  = 1
        PRE   = 'alpha2'

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
      end

      VERSION = Version::STRING
    end
  end
end
