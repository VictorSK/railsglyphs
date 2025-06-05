# RailsGlyphs — the essential SVG icon library

**RailsGlyphs is an essential SVG icon library built exclusively for Ruby on Rails projects!**

Supercharge your Rails apps with beautifully crafted, production-ready SVG icons that blend seamlessly into any design. RailsGlyphs makes it effortless to add scalable, customizable icons to your views, helping you ship polished interfaces faster and with less hassle.

Elevate your Rails project’s UI with RailsGlyphs — where design meets developer productivity.

## Installation

Add RailsGlyphs to your Rails application's Gemfile:

```ruby
gem "railsglyphs"
```

Then install it by running:

```bash
bundle install
```

Or, add the gem directly with Bundler:

```bash
bundle add railsglyphs
```

If you're not using Bundler, install the gem manually:

```bash
gem install railsglyphs
```

## Usage

To use RailsGlyphs in your Rails views, call the `icon` helper:

```ruby
icon(style, icon_name, text = nil, size: 24, **html_options)
```

**Parameters:**

- `style` — Choose either `"solid"` or `"outline"` to match your design.
- `icon_name` — The SVG icon name (e.g., `"x"`, `"check"`, `"user"`).
- `text` (optional) — Text to display after the icon.
- `size` (optional) — Icon size in pixels (default: `24`).
- `html_options` (optional) — Additional HTML attributes for the `<i>` tag wrapper (e.g., `title`, `class`, etc.).

**Examples:**

```ruby
# Basic usage
icon('solid', 'check')

# With text
icon('outline', 'user', 'Profile')

# Custom size and HTML attributes
icon('solid', 'x', 'Close', size: 40, title: 'Close this window', class: 'text-red-500')
```

This will render a scalable SVG icon, optionally followed by text, with your custom size and HTML attributes applied.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports, pull requests, and enhancements are welcome on [GitHub](https://github.com/VictorSK/railsglyphs). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. It's code, lets have fun!

## Code of Conduct

Everyone interacting in the railsglyphs project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/VictorSK/railsglyphs/blob/master/CODE_OF_CONDUCT.md).

## License

Copyright © 2025 Victor S. Keenan. The gem is available as open source under the terms of the [LICENSE](LICENSE) file.

## Coded With Love

Coded crafted by me, [Victor S. Keenan](https://www.victorkeenan.com). Find me on Twitter [@VictorSK](https://twitter.com/victorsk) or [hire me](https://www.inspyre.com) to design, develop, and grow your product or service.
