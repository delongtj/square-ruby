# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'square/version'

Gem::Specification.new do |spec|
  spec.name          = 'square-ruby'
  spec.version       = Square::VERSION
  spec.authors       = ['Brian Wm. McAllister', 'David Michael', 'Brianne King']
  spec.email         = ['brian.mcallister@giantmachines.com', 'david.michael@giantmachines.com', 'brianne.king@giantmachines.com']

  spec.summary       = 'Square Connect API library'
  spec.description   = 'Square Connect API'
  spec.homepage      = 'https://github.com/giantmachines/square-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'webmock', '~> 1.22'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'awesome_print', '~> 1.6'

  spec.add_runtime_dependency 'hashie', '~> 3.4'
  spec.add_runtime_dependency 'rest-client', '~> 1.8'
  spec.add_runtime_dependency 'multipart-post', '~> 2.0'
end
