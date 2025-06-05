# test/test_railsglyphs_test.rb
require "test_helper"
require "fileutils"

class TestRailsGlyphsIconHelper < Minitest::Test
  include RailsGlyphs::IconHelper

  SAMPLE_SVG = '<svg xmlns="http://www.w3.org/2000/svg"></svg>'

  def setup
    @tmp_dir = File.join(Dir.pwd, "tmp_icons")
    FileUtils.mkdir_p(File.join(@tmp_dir, "solid"))
    File.write(File.join(@tmp_dir, "solid", "star.svg"), SAMPLE_SVG)
    RailsGlyphs::IconHelper.icon_base_path = @tmp_dir
    RailsGlyphs::IconHelper::ICON_CACHE.clear
  end

  def teardown
    FileUtils.rm_rf(@tmp_dir)
    RailsGlyphs::IconHelper.icon_base_path = nil
  end

  def test_gem_asset_path_returns_path
    path = RailsGlyphs::IconHelper.gem_asset_path
    assert File.directory?(path)
  end

  def test_icon_base_path_getter_and_setter
    RailsGlyphs::IconHelper.icon_base_path = "/tmp/foo"
    assert_equal "/tmp/foo", RailsGlyphs::IconHelper.icon_base_path
  end

  def test_icon_raises_if_file_missing
    assert_raises(ArgumentError) { icon(:solid, "missing") }
  end

  def test_icon_returns_html_with_svg
    def self.content_tag(tag, content, options)
      "<#{tag} class='#{options[:class]}' aria-hidden='#{options['aria-hidden']}'>#{content}</#{tag}>"
    end
    html = icon(:solid, "star")
    assert_includes html, "<svg"
    assert_includes html, "height=\"24\""
    assert_includes html, "width=\"24\""
    assert_includes html, "aria-hidden='true'"
  end

  def test_icon_with_text_and_size
    def self.content_tag(tag, content, options)
      "<#{tag} class='#{options[:class]}' aria-hidden='#{options['aria-hidden']}'>#{content}</#{tag}>"
    end
    html = icon(:solid, "star", "Star", size: 32, class: "icon ")
    assert_includes html, "height=\"32\""
    assert_includes html, "width=\"32\""
    assert_includes html, "Star"
    assert_includes html, "class='icon'"
  end

  def test_icon_caches_svg_content
    def self.content_tag(tag, content, options)
      "<#{tag}>#{content}</#{tag}>"
    end
    icon(:solid, "star")
    assert RailsGlyphs::IconHelper::ICON_CACHE.any?
    # Call again, should use cache (no error)
    icon(:solid, "star")
  end
end

class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
end

class String
  def blank?
    strip.empty?
  end

  def html_safe
    self
  end
end
