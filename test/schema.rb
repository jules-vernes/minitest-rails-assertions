# encoding: utf-8

require 'active_record'

ActiveRecord::Base.establish_connection adapter: :nulldb

silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :cateogries do |t|
      t.integer :status, default: 0
      t.string  :name, null: false
    end

    create_table :products do |t|
      t.references :category
      t.string     :type1,     default: 0
      t.string     :type2,     default: 0
      t.integer    :quantity,  default: 0
      t.string     :name,         null: false
      t.string     :reference,    null: false
      t.string     :secret_code,  null: false
      t.boolean    :published, default: false
      t.datetime   :deleted_at
    end

    add_index :products, :category_id
    add_index :products, :reference, unique: true
  end
end
