$:.push File.expand_path("../lib", __FILE__)

require "service_generator/version"

Gem::Specification.new do |s|
  s.name        = "service_generator"
  s.version     = ServiceGenerator::VERSION
  s.authors     = ["RAWHIDE. Co., Ltd."]
  s.email       = ["info@raw-hide.co.jp"]
  s.homepage    = ""
  s.summary     = "generate service class."
  s.description = "generate service class."
  s.license     = "MIT"

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency 'rspec', ['>= 0']
end
