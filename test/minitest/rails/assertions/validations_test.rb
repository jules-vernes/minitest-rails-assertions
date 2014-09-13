# encoding: utf-8

require 'test_helper'

module Minitest
  class Rails::Assertions::ValidationsTest < Test
    test "Category has an associated validator on products" do
      assert_associated Category, :products
    end

    {
        acceptance: :published,
           absence: :deleted_at,
      confirmation: :secret_code,
         exclusion: [:type1, in: 0..5],
            format: [:reference, with: /\A\w\d{9}\z/i],
         inclusion: [:type2, in: 0..5],
            length: [:secret_code, is: 4],
          presence: :name,
        uniqueness: :reference
    }.each do |validator, value|
      attribute, options = *Array(value)
      test "Product has a #{validator} validator on #{attribute}" do
        send("assert_#{validator}_of", Product, attribute, options)
      end
    end

    test 'Product has a length validator on name' do
      assert_length_of Product, :name, maximum: 30
    end

    test 'Product has format & uniqueness validators on reference' do
      assert_validates Product, :reference, format: { with: /\A\w\d{9}\z/i }, uniqueness: true
    end

    test 'Product has a presence validator on name (validator)' do
      assert_validator :presence, Product, :name
    end
  end
end
