require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "papersync"
    gem.summary = %Q{Download your Instapaper content in mobi format}
    gem.description = %Q{TODO: longer description of your gem}
    gem.email = "james@netlagoon.com"
    gem.homepage = "http://github.com/jfairbairn/papersync"
    gem.authors = ["James Fairbairn"]
    gem.executables = 'papersync'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

task :test => :check_dependencies

task :default => :test

