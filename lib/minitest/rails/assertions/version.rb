# encoding: utf-8

module Minitest
  module Rails
    module Assertions
      module Version
        MAJOR = 0
        MINOR = 1
        TINY  = 0
        PRE   = nil

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
      end

      VERSION = Version::STRING
    end
  end
end
