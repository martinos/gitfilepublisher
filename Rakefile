require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.require(:default, :development)

require "rake/rdoctask"
require "rake/testtask"

task :default => [:test]

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*_test.rb']
  t.ruby_opts = ['-rubygems -I.'] if defined? Gem
end
