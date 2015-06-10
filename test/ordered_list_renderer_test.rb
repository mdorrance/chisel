require 'minitest/autorun'
require './lib/ordered_list_renderer'

class OrderedListRendererTest < Minitest::Test

  attr_reader :renderer

  def setup
    @renderer = OrderedListRenderer.new
  end

  def test_it_exists
    assert OrderedListRenderer
  end

  def test_it_renders_a_single_item_list
    input = "1. hello"
    expected = "<ol>\n  <li>hello</li>\n</ol>"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_two_item_list
    input = "1. hello\n2. world"
    expected = "<ol>\n  <li>hello</li>\n  <li>world</li>\n</ol>"
    assert_equal expected, renderer.format(input)
  end
end
