# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "railsglyphs"
require "minitest/autorun"

# Minimal stubs for Rails methods used by IconHelper,
# so tests can run without a full Rails environment.
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
