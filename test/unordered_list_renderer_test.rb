require 'minitest/autorun'
require './lib/unordered_list_renderer'

class UnorderedListRendererTest < Minitest::Test

  attr_reader :renderer

  def setup
    @renderer = UnorderedListRenderer.new
  end

  def test_it_exists
    assert UnorderedListRenderer
  end

  def test_it_renders_a_single_item_list
    input = "1. hello"
    expected = "<ul>\n  <li>hello</li>\n</ul>"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_two_item_list
    input = "1. hello\n2. world"
    expected = "<ul>\n  <li>hello</li>\n  <li>world</li>\n</ul>"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_three_item_list
    input = "1. hello\n2. world\n3. universe"
    expected = "<ul>\n  <li>hello</li>\n  <li>world</li>\n  <li>universe</li>\n</ul>"
    assert_equal expected, renderer.format(input)
  end

end