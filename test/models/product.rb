# encoding: utf-8

require 'active_record'

class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products

  validates :type1, exclusion: { in: 0..5 }
  validates :type2, inclusion: { in: 0..5 }
  validates :quantity, numericality: true
  validates :name, presence: true
  validates :reference, uniqueness: true, format: { with: /\A\w\d{9}\z/i }
  validates :secret_code, confirmation: true, length: { is: 4 }
  validates :published, acceptance: true
  validates :deleted_at, absence: true
  # Alias of validates_length_of
  validates_size_of :name, maximum: 30
end
