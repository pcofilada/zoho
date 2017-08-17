# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoho/version'

Gem::Specification.new do |spec|
  spec.name          = 'zoho'
  spec.version       = Zoho::VERSION
  spec.authors       = ['Patrick Ofilada']
  spec.email         = ['pcofilada@gmail.com']

  spec.summary       = 'Ruby wrapper for Zoho API.'
  spec.description   = 'Ruby wrapper for Zoho API.'
  spec.homepage      = 'https://github.com/pcofilada/zoho'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
