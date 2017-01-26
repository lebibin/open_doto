# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_doto/version'

Gem::Specification.new do |spec|
  spec.name          = 'open_doto'
  spec.version       = OpenDoto::VERSION
  spec.authors       = ['Kevin Candelaria']
  spec.email         = ['kevdashdev@gmail.com']

  spec.summary       = %q{Ruby gem for accessing the OpenDota API}
  spec.description   = %q{Ruby gem for accessing the OpenDota API}
  spec.homepage      = 'https://github.com/lebibin/open_doto'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2.6'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
