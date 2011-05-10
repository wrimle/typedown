# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{typedown}
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["wrimle"]
  s.date = %q{2011-05-10}
  s.default_executable = %q{typedown}
  s.description = %q{Typedown is a markdown preprocessor which forwards it's output to a markdown parser. Presently bluecloth}
  s.email = %q{rmyrland@gmail.com}
  s.executables = ["typedown"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "Manifest.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/typedown",
    "lib/typedown.rb",
    "lib/typedown/document.rb",
    "lib/typedown/section.rb",
    "lib/typedown/shorthand.rb",
    "script/console",
    "script/destroy",
    "script/generate",
    "test/data/example.tpd",
    "test/data/example2.tpd",
    "test/data/example3.tpd",
    "test/helper.rb",
    "test/test_document.rb",
    "test/test_section.rb",
    "typedown.gemspec"
  ]
  s.homepage = %q{http://github.com/wrimle/typedown}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A markdown dialect optimized for fast typing on mobile devices}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bluecloth>, [">= 2.0.7"])
    else
      s.add_dependency(%q<bluecloth>, [">= 2.0.7"])
    end
  else
    s.add_dependency(%q<bluecloth>, [">= 2.0.7"])
  end
end

