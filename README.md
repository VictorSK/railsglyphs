# RailsGlyphs — The essential SVG icon library

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Ruby](https://img.shields.io/badge/ruby-%3E%3D3.1-red)
[![Issues](https://img.shields.io/github/issues/VictorSK/railsglyphs)](https://github.com/VictorSK/railsglyphs/issues)
[![Last Commit](https://img.shields.io/github/last-commit/VictorSK/railsglyphs)](https://github.com/VictorSK/railsglyphs/commits/main)

**RailsGlyphs is an essential SVG icon library built exclusively for Ruby on Rails projects!**

Supercharge your Rails apps with beautifully crafted, production ready SVG icons that blend seamlessly into any design. RailsGlyphs makes it effortless to add scalable, customizable icons served as raw SVG files and fully cached when rendered to your views, helping you ship polished interfaces faster and with less hassle.

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
  See the [full icon list and names](Icons.md).
- `text` (optional) — Text to display after the icon.
  **Note:** If provided, the text will be automatically wrapped in a `<span class="icon-text">...</span>` for easy styling.
- `size` (optional) — Icon size in pixels (default: `24`).
- `html_options` (optional) — Additional HTML attributes for the `<i>` tag wrapper (e.g., `title`, `class`, etc.).

**Examples:**

```ruby
# Basic usage
icon('solid', 'check')

# With text (text will be wrapped in <span class="icon-text">)
icon('outline', 'user', 'Profile')

# Custom size and HTML attributes
icon('solid', 'x', 'Close', size: 40, title: 'Close this window', class: 'text-red-500')
```

This will render a scalable SVG icon, optionally followed by text (wrapped in a span for styling), with your custom size and HTML attributes applied.

## Adding or Customizing Icons

RailsGlyphs stores SVG icons in the `assets/icons` directory, organized by style (`solid` or `outline`). To add your own icons or customize the set:

1. **Add a New Icon:**

   - Place your SVG file in the appropriate style folder, e.g.:
     - `assets/icons/solid/my_icon.svg`
     - `assets/icons/outline/my_icon.svg`
   - Name your SVG file using lowercase letters and underscores (e.g., `user_add.svg`).

2. **Override Icons in Your App:**

   - By default, RailsGlyphs uses the gem’s built-in icons.
   - To use your own icons, set a custom icon base path in an initializer:

     ```ruby
     RailsGlyphs::IconHelper.icon_base_path = Rails.root.join("app/assets/icons")
     ```

   - Place your custom SVGs in the same folder structure as above.

3. **Icon Naming:**

   - The `icon` helper uses the filename (without `.svg`) as the icon name.
   - For example, `icon('solid', 'user_add')` will look for `solid/user_add.svg`.

4. **Reloading:**
   - If you add or change icons while your Rails server is running, you may need to restart the server to clear the icon cache.

## Contributing

Bug reports, pull requests, and enhancements are welcome on [GitHub](https://github.com/VictorSK/railsglyphs). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. It's code, lets have fun!

## Code of Conduct

Everyone interacting in the railsglyphs project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/VictorSK/railsglyphs/blob/master/CODE_OF_CONDUCT.md).

## License

Copyright © 2025 Victor S. Keenan. The gem is available as open source under the terms of the [LICENSE](LICENSE) file.

## Coded With Love

Coded crafted by me, [Victor S. Keenan](https://www.victorkeenan.com). Find me on Twitter [@VictorSK](https://twitter.com/victorsk) or [hire me](https://www.inspyre.com) to design, develop, and grow your product or service.
