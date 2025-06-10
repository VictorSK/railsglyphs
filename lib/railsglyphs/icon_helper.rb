# frozen_string_literal: true

require 'erb'
require 'digest'
require 'concurrent'

module RailsGlyphs
  module IconHelper
    ICON_CACHE = Concurrent::Hash.new

    # Returns the absolute path to the gem's asset directory
    def self.gem_asset_path
      File.expand_path('../../assets/icons', __dir__)
    end

    # Optionally allow the icon path to be overridden in the host app
    def self.icon_base_path
      @icon_base_path || gem_asset_path
    end

    def self.icon_base_path=(path)
      @icon_base_path = path
    end

    def icon(style, name, text = nil, html_options = {})
      text, html_options = nil, text if text.is_a?(Hash)
      height = html_options[:size] || 24
      width  = html_options[:size] || 24
      html_options.delete(:size)

      text = content_tag(:span, text, class: "icon-text") unless text.blank?

      svg_path = File.join(RailsGlyphs::IconHelper.icon_base_path, style.to_s, "#{name}.svg")
      raise ArgumentError, "Icon '#{name}' with style '#{style}' not found at #{svg_path}." unless File.exist?(svg_path)

      cache_key = "#{style}-#{name}-#{Digest::MD5.hexdigest(text.to_s)}-#{height}-#{width}"

      svg_content = ICON_CACHE[cache_key] ||= begin
        svg = File.read(svg_path)
        svg.gsub!('<svg', "<svg style=\"display: inline-block;\" height=\"#{height}\" width=\"#{width}\"")
        svg.html_safe
      end

      html_options[:class] = html_options[:class].strip if html_options[:class]
      html_options['aria-hidden'] ||= true

      html = content_tag(:i, svg_content, html_options)
      html << ' '.html_safe << text.to_s unless text.blank?
      html
    end
  end
end
