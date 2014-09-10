begin
  require 'bundler/gem_tasks'
  require 'rake/testtask'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = Dir['test/**/*_test.rb']
  t.verbose = false
end

task default: :test
