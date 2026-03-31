# frozen_string_literal: true

require "concurrent"

module RailsGlyphs
  module IconHelper
    ICON_CACHE = Concurrent::Hash.new

    # Returns the absolute path to the gem's asset directory
    def self.gem_asset_path
      File.expand_path("../../assets/icons", __dir__)
    end

    # Optionally allow the icon path to be overridden in the host app
    def self.icon_base_path
      @icon_base_path || gem_asset_path
    end

    def self.icon_base_path=(path)
      @icon_base_path = path
      @valid_styles = nil
    end

    def self.valid_styles
      @valid_styles ||= Dir.children(icon_base_path).select { |d| File.directory?(File.join(icon_base_path, d)) }
    end

    def icon(style, name, text = nil, html_options = {})
      if text.is_a?(Hash)
        html_options = text
        text = nil
      end
      html_options = html_options.dup
      height = html_options.delete(:size) || 24
      width  = height

      raise ArgumentError, "Icon name cannot be blank." if name.to_s.strip.empty?

      text = content_tag(:span, text, class: "icon-text") unless text.blank?

      unless RailsGlyphs::IconHelper.valid_styles.include?(style.to_s)
        raise ArgumentError,
              "Unknown icon style '#{style}'. Valid styles: #{RailsGlyphs::IconHelper.valid_styles.join(", ")}"
      end

      svg_path = File.join(RailsGlyphs::IconHelper.icon_base_path, style.to_s, "#{name}.svg")
      raise ArgumentError, "Icon '#{name}' with style '#{style}' not found at #{svg_path}." unless File.exist?(svg_path)

      cache_key = "#{style}-#{name}-#{height}-#{width}"

      svg_content = ICON_CACHE[cache_key] ||= begin
        svg = File.read(svg_path)
        svg.gsub!(/\s*(height|width|aria-hidden)="[^"]*"/, "")
        svg.gsub!("<svg", "<svg style=\"display: inline-block;\" height=\"#{height}\" width=\"#{width}\"")
        svg.html_safe
      end

      html_options[:class] = html_options[:class].strip if html_options[:class]
      html_options["aria-hidden"] = true unless html_options.key?("aria-hidden")

      html = content_tag(:i, svg_content, html_options)
      html << " ".html_safe << text.to_s unless text.blank?
      html
    end
  end
end
