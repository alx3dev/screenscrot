# frozen_string_literal: true

require_relative 'lib/screenscrot/version'

Gem::Specification.new do |spec|
  spec.name = 'screenscrot'
  spec.version = ScreenScrot::VERSION
  spec.authors = 'Alx3Dev'
  spec.email = 'alx3dev@gmail.com'

  spec.summary = 'Terminal to GIF recording with Ruby and Scrot.'
  spec.description = <<~DESCRIPTION
    Get screenshots with Scrot, and convert into GIF. Simple terminal
    recording with Ruby and Scrot.
  DESCRIPTION

  spec.homepage = 'https://www.github.com/alx3dev/screenscrot'

  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"
  spec.metadata['documentation_uri'] = "https://rubygems.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = %w[lib/screenscrot.rb
                  lib/screenscrot/version.rb]

  spec.bindir = 'bin'
  spec.require_paths = 'lib'
  spec.executables = 'screenscrot'

  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0.1'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
end
