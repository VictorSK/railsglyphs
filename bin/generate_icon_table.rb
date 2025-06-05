#!/usr/bin/env ruby
# frozen_string_literal: true

require 'set'

SOLID_DIR   = File.expand_path('../assets/icons/solid', __dir__)
OUTLINE_DIR = File.expand_path('../assets/icons/outline', __dir__)
OUTPUT      = File.expand_path('../Icons.md', __dir__)

def icon_names(dir)
  Dir.glob(File.join(dir, '*.svg')).map { |f| File.basename(f, '.svg') }
end

solid_icons   = icon_names(SOLID_DIR)
outline_icons = icon_names(OUTLINE_DIR)
all_icons     = Set.new(solid_icons + outline_icons).to_a.sort

header = <<~MD
  # Available Icons

  Below is a list of all SVG icons included in RailsGlyphs.
  Use the icon name (filename without `.svg`) with the `icon` helper.

  **Solid icons:** #{solid_icons.size} &nbsp;&nbsp; **Outline icons:** #{outline_icons.size}

  | Icon Name | Solid Example | Outline Example |
  | --------- | ------------- | --------------- |
MD

rows = all_icons.map do |icon|
  solid_path   = solid_icons.include?(icon)   ? "![solid](assets/icons/solid/#{icon}.svg)"     : ""
  outline_path = outline_icons.include?(icon) ? "![outline](assets/icons/outline/#{icon}.svg)" : ""
  "| #{icon} | #{solid_path} | #{outline_path} |"
end

File.write(OUTPUT, header + rows.join("\n") + "\n")

puts "Icons.md updated with #{all_icons.size} icons."
