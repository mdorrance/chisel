require 'minitest/autorun'
require_relative '../lib/strikethrough_renderer'

class StrikethroughRendererTest < Minitest::Test

  def test_renderer_class
    assert StrikethroughRenderer
  end

  def test_it_formats_a_strikethrough
    input = "~~mistake~~"
    expected = "<del>mistake</del>"
    renderer = StrikethroughRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_actually_formats_a_strikethrough
    input = "~~testing~~"
    expected = "<del>testing</del>"
    renderer = StrikethroughRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_a_strikethrough_within_a_string
    input = "hello~~testing~~world"
    expected = "hello<del>testing</del>world"
    renderer = StrikethroughRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

end
