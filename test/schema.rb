# encoding: utf-8

require 'active_record'

ActiveRecord::Base.establish_connection adapter: :nulldb

silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :products do |t|
      t.string :name,      null: false
      t.string :reference, null: false
    end

    add_index :products, :reference, unique: true
  end
end
