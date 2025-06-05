# frozen_string_literal: true

require_relative "lib/railsglyphs/version"

Gem::Specification.new do |spec|
  spec.name = "railsglyphs"
  spec.version = RailsGlyphs::VERSION
  spec.authors = ["Victor S. Keenan"]
  spec.email = ["me@victorkeenan.com"]

  spec.summary = "Simple helper utility for using SVG icons within your Rails project."
  spec.description = "Simple helper utility for using SVG icons within your Rails project."
  spec.homepage = "https://www.victorkeenan.com/projects/railsglyphs/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/VictorSK/railsglyphs/"
  spec.metadata["changelog_uri"] = "https://github.com/VictorSK/railsglyphs/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = 'true'
  spec.files         = Dir["lib/**/*.rb"]

  spec.add_dependency "rails", ">= 6.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
