require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/typedown'


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "typedown"
    gem.summary = %Q{A markdown dialect optimized for fast typing on mobile devices}
    gem.description = %Q{Typedown is a markdown preprocessor which forwards it's output to a markdown parser. Presently bluecloth}
    gem.email = "rmyrland@gmail.com"
    gem.homepage = "http://github.com/wrimle/typedown"
    gem.authors = ["wrimle"]
    gem.add_dependency('bluecloth','>= 2.0.7')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

