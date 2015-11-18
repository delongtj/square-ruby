# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'square/version'

Gem::Specification.new do |spec|
  spec.name          = "square-ruby"
  spec.version       = Square::VERSION
  spec.authors       = ["Brian McAllister", "David Michael"]
  spec.email         = ["brian@giantmachines.com"]

  spec.summary       = %q{Square Connect API}
  spec.description   = %q{Square Connect API}
  spec.homepage      = "https://github.com/giantmachines/square-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"

  spec.add_runtime_dependency "hashie", "~> 3.4.3"
  spec.add_runtime_dependency "rest-client", "~> 1.8"
  spec.add_runtime_dependency "multipart-post", "~> 2.0"
end
