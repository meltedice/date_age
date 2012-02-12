# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "date_age/version"

Gem::Specification.new do |s|
  s.name        = "date_age"
  s.version     = DateAge::VERSION
  s.authors     = ["ice"]
  s.email       = ["meltedise@gmail.com"]
  s.homepage    = ""
  s.summary     = "date_age-#{s.version}"
  s.description = "Calculate age with Date class"
  s.license = 'MIT'

  s.rubyforge_project = "date_age"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency %q<rspec>, ['~> 2.0.0.beta.22']
    else
      s.add_dependency %q<rspec>, ['~> 2.0.0.beta.22']
    end
  else
    s.add_dependency %q<rspec>, ['~> 2.0.0.beta.22']
  end
end
