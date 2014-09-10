# encoding: utf-8

require 'test_helper'

module Minitest
  class Rails::Assertions::ValidationsTest < Test
    test 'Product has a presence validator on name' do
      assert_presence_of Product, :name, { allow_blank: true }
    end

    test 'Product has a uniqueness validator on reference' do
      assert_uniqueness_of Product, :reference, { case_sensitive: false }
    end
  end
end
