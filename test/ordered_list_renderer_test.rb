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
    expected = "<ol>\n  <li>hello</li>\n</ol>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_two_item_list
    input = "1. hello\n2. world"
    expected = "<ol>\n  <li>hello</li>\n  <li>world</li>\n</ol>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_three_item_list
    input = "1. hello\n2. world\n3. universe"
    expected = "<ol>\n  <li>hello</li>\n  <li>world</li>\n  <li>universe</li>\n</ol>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_three_item_list_with_em_and_strong
    input = "1. hello\n2. world <em>war</em>\n3. universe <strong>man</strong> woman"
    expected = "<ol>\n  <li>hello</li>\n  <li>world <em>war</em></li>\n  <li>universe <strong>man</strong> woman</li>\n</ol>\n\n"
    assert_equal expected, renderer.format(input)
  end

end
