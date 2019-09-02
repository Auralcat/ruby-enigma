lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_enigma/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_enigma'
  spec.version       = RubyEnigma::VERSION
  spec.authors       = ['Auralcat']
  spec.email         = ['ashleyzt@hi2.in']

  spec.summary       = %q{Reproduce the workings of the Enigma machine with Ruby.}
  spec.description   = %q{This is an implementation of the specs of the Enigma machine from WWII in Ruby.}
  spec.homepage      = 'https://kaibacorp.com'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'TODO: Set to 'http://mygemserver.com''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://kaibacorp.com'
  spec.metadata['changelog_uri'] = 'https://my-changelog-uri.com'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rubocop'
end
