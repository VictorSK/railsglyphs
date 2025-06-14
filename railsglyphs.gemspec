# frozen_string_literal: true

require_relative "lib/railsglyphs/version"

Gem::Specification.new do |spec|
  spec.name = "railsglyphs"
  spec.version = RailsGlyphs::VERSION
  spec.authors = ["Victor S. Keenan"]
  spec.email = ["me@victorkeenan.com"]

  spec.summary = "RailsGlyphs — the essential Rails SVG icon library"
  spec.description = "RailsGlyphs is an essential SVG icon library built exclusively for Ruby on Rails projects!"
  spec.homepage = "https://www.victorkeenan.com/projects/railsglyphs/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/VictorSK/railsglyphs/"
  spec.metadata["changelog_uri"] = "https://github.com/VictorSK/railsglyphs/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/VictorSK/railsglyphs/issues/"
  spec.metadata["documentation_uri"] = "https://github.com/VictorSK/railsglyphs/blob/main/README.md"
  spec.metadata["rubygems_mfa_required"] = 'true'
  spec.files = Dir["lib/**/*.rb", "assets/**/*"]

  spec.add_dependency "rails", ">= 6.0"
end
