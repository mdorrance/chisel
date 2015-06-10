require 'minitest/autorun'
require_relative '../lib/strong_renderer'

class StrongRendererTest < Minitest::Test

  def test_stongrenderer_class
    assert StrongRenderer
  end

  def test_it_formats_a_strong
    input = "**mistake**"
    expected = "<strong>mistake</strong>"
    renderer = StrongRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_actually_formats_a_strong
    input = "**testing**"
    expected = "<strong>testing</strong>"
    renderer = StrongRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_a_strong_within_a_string
    input = "hello**testing**world"
    expected = "hello<strong>testing</strong>world"
    renderer = StrongRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_multiple_strong_within_a_string
    input = "hello**testing**world **hi**"
    expected = "hello<strong>testing</strong>world <strong>hi</strong>"
    renderer = StrongRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_a_strong_with_numbers_within_a_string
    input = "hello **1.2345** world"
    expected = "hello <strong>1.2345</strong> world"
    renderer = StrongRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

end
