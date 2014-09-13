# Minitest::Rails::Assertions

[![Gem Version](https://badge.fury.io/rb/minitest-rails-assertions.svg)](http://badge.fury.io/rb/minitest-rails-assertions) [![Build Status](https://travis-ci.org/jules-vernes/minitest-rails-assertions.svg)](https://travis-ci.org/jules-vernes/minitest-rails-assertions) [![Code Climate](https://codeclimate.com/github/jules-vernes/minitest-rails-assertions/badges/gpa.svg)](https://codeclimate.com/github/jules-vernes/minitest-rails-assertions) [![Test Coverage](https://codeclimate.com/github/jules-vernes/minitest-rails-assertions/badges/coverage.svg)](https://codeclimate.com/github/jules-vernes/minitest-rails-assertions)

The gem minitest-rails-assertions extends MiniTest to add some assertions for
Rails specific methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-rails-assertions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-rails-assertions

## Usage

Add in your `test_helper.rb`:

```ruby
require 'minitest/rails/assertions'
```

Use the assertions like the Minitest assertion. For instance:

```ruby
assert_length_of Product, :name, maximum: 30
assert_validates Product, :reference, format: { with: /\A\w\d{9}\z/i }, uniqueness: true
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/minitest-rails-assertions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
