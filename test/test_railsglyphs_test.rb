# frozen_string_literal: true

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
    html = icon(:solid, "star")

    assert_includes html, "<svg"
    assert_includes html, "height=\"24\""
    assert_includes html, "width=\"24\""
    assert_includes html, "aria-hidden='true'"
  end

  def test_icon_with_text_and_size
    html = icon(:solid, "star", "Star", size: 32, class: "icon ")

    assert_includes html, "height=\"32\""
    assert_includes html, "width=\"32\""
    assert_includes html, "Star"
    assert_includes html, "class='icon'"
  end

  def test_icon_caches_svg_content
    icon(:solid, "star")

    assert_predicate RailsGlyphs::IconHelper::ICON_CACHE, :any?
    icon(:solid, "star")
  end

  def test_icon_treats_third_arg_as_html_options_if_hash
    html = icon(:solid, "star", { class: "foo", title: "bar" })

    assert_includes html, "class='foo'"
    assert_includes html, "title='bar'" if html.include?("title=")
  end

  def test_icon_does_not_overwrite_existing_aria_hidden
    html = icon(:solid, "star", nil, "aria-hidden" => false, class: "icon")

    assert_includes html, "aria-hidden='false'"
  end

  def test_icon_wraps_text_in_span
    html = icon(:solid, "star", "Wrapped")

    assert_includes html, "<span class='icon-text'>Wrapped</span>"
  end

  def test_icon_cache_key_changes_with_size_not_text
    icon(:solid, "star", "A", size: 24)
    key1 = RailsGlyphs::IconHelper::ICON_CACHE.keys.first
    RailsGlyphs::IconHelper::ICON_CACHE.clear
    icon(:solid, "star", "B", size: 24)
    key2 = RailsGlyphs::IconHelper::ICON_CACHE.keys.first

    assert_equal key1, key2, "Cache key should not change with different text"
    RailsGlyphs::IconHelper::ICON_CACHE.clear
    icon(:solid, "star", "A", size: 32)
    key3 = RailsGlyphs::IconHelper::ICON_CACHE.keys.first

    refute_equal key1, key3, "Cache key should change with different size"
  end

  def test_icon_accepts_string_and_symbol_style
    assert icon(:solid, "star")
    assert icon("solid", "star")
  end

  def test_icon_with_blank_text
    html = icon(:solid, "star", "")

    refute_includes html, "<span"
  end

  def test_icon_does_not_mutate_html_options
    opts = { class: " icon ", size: 32 }
    opts_before = opts.dup
    icon(:solid, "star", nil, opts)

    assert_equal opts_before, opts, "html_options hash should not be mutated"
  end

  def test_icon_raises_on_invalid_style
    assert_raises(ArgumentError) do
      icon(:bold, "star")
    end
  end

  def test_icon_raises_on_nil_name
    assert_raises(ArgumentError) { icon(:solid, nil) }
  end

  def test_icon_raises_on_empty_name
    assert_raises(ArgumentError) { icon(:solid, "") }
  end

  def test_icon_strips_existing_height_width_and_aria_hidden_from_svg
    svg_with_attrs = '<svg xmlns="http://www.w3.org/2000/svg" height="48" width="48" aria-hidden="true"></svg>'
    File.write(File.join(@tmp_dir, "solid", "sized.svg"), svg_with_attrs)
    html = icon(:solid, "sized")

    # Should have exactly one height/width (injected), not duplicates
    assert_equal 1, html.scan('height="24"').length
    assert_equal 1, html.scan('width="24"').length
    refute_includes html, 'height="48"'
    refute_includes html, 'width="48"'
  end

  def test_icon_base_path_falls_back_to_gem_asset_path_after_reset
    RailsGlyphs::IconHelper.icon_base_path = "/tmp/custom"

    assert_equal "/tmp/custom", RailsGlyphs::IconHelper.icon_base_path
    RailsGlyphs::IconHelper.icon_base_path = nil

    assert_equal RailsGlyphs::IconHelper.gem_asset_path, RailsGlyphs::IconHelper.icon_base_path
  end

  private

  def content_tag(tag, content, options = {})
    attrs = options.map { |k, v| "#{k}='#{v}'" }.join(" ")
    if attrs.empty?
      "<#{tag}>#{content}</#{tag}>"
    else
      "<#{tag} #{attrs}>#{content}</#{tag}>"
    end
  end
end
