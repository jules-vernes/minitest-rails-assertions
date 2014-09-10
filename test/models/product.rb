# encoding: utf-8

require 'active_record'

Product = Class.new(ActiveRecord::Base) do
  validates :name,        presence: { allow_blank: true }
  validates :reference, uniqueness: { case_sensitive: false }
end
