# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/named_route/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-named_route"
  spec.version       = Sinatra::NamedRoute::VERSION
  spec.authors       = ["namusyaka"]
  spec.email         = ["namusyaka@gmail.com"]

  spec.summary       = %q{Supports named routes and makes it easy to access to URI path.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/namusyaka/sinatra-named_route"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mustermann"
end
