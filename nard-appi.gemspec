# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nard/appi/version'

Gem::Specification.new do |spec|
  spec.name          = "nard-appi"
  spec.version       = Nard::Appi::VERSION
  spec.authors       = ["Shu Fujita"]
  spec.email         = [ 's.fujita@nard.tech' ]

  spec.summary = 'This gem \'nard-appi\' enables you to access to APIs more easily.'
  spec.description = 'This gem \'nard-appi\' enables you to access to APIs more easily. You can make API wrapper by using classes and modules contained in this gem.'
  spec.homepage = 'https://github.com/nard-tech/nard-appi'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '~> 5.0', '>= 5.0.0.1'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
