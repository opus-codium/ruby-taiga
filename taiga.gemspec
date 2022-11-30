# frozen_string_literal: true

require_relative 'lib/taiga/version'

Gem::Specification.new do |spec|
  spec.name = 'taiga'
  spec.version = Taiga::VERSION
  spec.authors = ['Romuald Conty']
  spec.email = ['romuald@opus-codium.fr']

  spec.summary = 'Taiga API client'
  spec.description = 'Taiga API client'
  spec.homepage = 'https://github.com/opus-codium/ruby-taiga'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'flexirest'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'github_changelog_generator'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
