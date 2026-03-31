# CHANGELOG

The noteworthy updates for each RailsGlyphs version are included here. For a complete changelog, see the git history.

## [1.1.0] - 2026-03-31

### Fixed

- Icon helper no longer modifies the options hash passed by the caller
- Improved SVG rendering to prevent duplicate HTML attributes
- Better caching — icons with different text now correctly share cached SVG content

### Changed

- Gem now depends on `actionview` instead of the full `rails` gem, reducing install footprint
- Invalid style or icon names now raise clear, actionable error messages

### Added

- GitHub Actions CI across Ruby 3.1, 3.2, 3.3, and 3.4
- RuboCop linting
- Expanded test coverage

## [1.0.4] - 2025-06-12

### Changed

- Refactored tests for complete code coverage
- General maintenance

_Note: 1.0.3 was pulled shortly after release due to a bug and replaced by this version._

## [1.0.2] - 2025-06-05

### Fixed

- Resolved incorrect asset file path lookup

## [1.0.1] - 2025-06-05

### Added

- Full test coverage
- Icon documentation

### Changed

- Documentation improvements

## [1.0.0] - 2025-06-04

### Added

- Initial release
