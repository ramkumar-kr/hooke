
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hooke/version'

Gem::Specification.new do |spec|
  spec.name          = 'hooke'
  spec.version       = Hooke::VERSION
  spec.authors       = ['Ramkumar']
  spec.email         = ['ramkumar.kr94@gmail.com']

  spec.summary       = 'Copy and share your git hooks'
  spec.description   = 'Creates a soft link from git_hooks \
  directory to .git/hooks on bundle install'
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.post_install_message = 'You are now hooked'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'bundler', '> 1.15'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.50'
  spec.add_development_dependency 'simplecov', '~> 0.12'
end
