# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TryPaper/version'

Gem::Specification.new do |spec|
  spec.name          = "trypaper"
  spec.version       = TryPaper::VERSION
  spec.authors       = ["Patrick Jones"]
  spec.email         = ["pmichaeljones@gmail.com"]
  spec.summary       = %q{This gem is used to access the TryPaper postal mailing API.}
  spec.description   = %q{Using this gem allows you to upload Base64 encoded documents and send them to the TryPaper API endoints. Manage your mailing from your TryPaper dashboard.}
  spec.homepage      = "http://github.com/pmichaeljones/trypaperapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

end
