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
    expected = "<ul>\n  <li>hello</li>\n</ul>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_two_item_list
    input = "1. hello\n2. world"
    expected = "<ul>\n  <li>hello</li>\n  <li>world</li>\n</ul>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_three_item_list
    input = "1. hello\n2. world\n3. universe"
    expected = "<ul>\n  <li>hello</li>\n  <li>world</li>\n  <li>universe</li>\n</ul>\n\n"
    assert_equal expected, renderer.format(input)
  end

  def test_it_renders_a_three_item_list_with_em_and_strong
    input = "1. <strong>hell</strong>o\n2. world\n3. universe <em>man</em>"
    expected = "<ul>\n  <li><strong>hell</strong>o</li>\n  <li>world</li>\n  <li>universe <em>man</em></li>\n</ul>\n\n"
    assert_equal expected, renderer.format(input)
  end

end

