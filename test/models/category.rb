# encoding: utf-8

require 'active_record'

class Category < ActiveRecord::Base
  has_many :products, inverse_of: :category

  validates :products, associated: true
end
