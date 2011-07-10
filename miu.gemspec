# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "miu/version"

Gem::Specification.new do |s|
  s.name        = "miu"
  s.version     = Miu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Dew"]
  s.email       = ["jason.dew@gmail.com"]
  s.homepage    = "http://jasondew.com/"
  s.summary     = %q{MIU tools from Hofstadter's GEB"}
  s.description = %q{Just some code I wrote to play with MIU}

  s.rubyforge_project = "miu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rubytree"
end
