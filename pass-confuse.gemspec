require_relative 'lib/pass/confuse/version'

Gem::Specification.new do |spec|
  spec.name          = 'pass-confuse'
  spec.version       = Pass::Confuse::VERSION
  spec.authors       = ['Romuald Conty']
  spec.email         = ['romuald@opus-codium.fr']

  spec.summary       = 'Protect config files access'
  spec.description   = 'Allow any files to be stored and its access protected with `pass`'
  spec.homepage      = 'https://github.com/opus-codium/pass-confuse'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/opus-codium/pass-confuse'
  spec.metadata['changelog_uri'] = 'https://github.com/opus-codium/pass-confuse/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rfusefs'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
