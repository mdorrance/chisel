require 'minitest/autorun'
require_relative '../lib/em_renderer'

class EmRendererTest < Minitest::Test

  def test_renderer_class
    assert EmRenderer
  end

  def test_it_formats_an_em
    input = "*mistake*"
    expected = "<em>mistake</em>"
    renderer = EmRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_actually_formats_an_em
    input = "*testing*"
    expected = "<em>testing</em>"
    renderer = EmRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_an_em_within_a_string
    input = "hello*testing*world"
    expected = "hello<em>testing</em>world"
    renderer = EmRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_multiple_em_within_a_long_string
    input = "hello *testing* world, *hi*"
    expected = "hello <em>testing</em> world, <em>hi</em>"
    renderer = EmRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_multiple_em_within_a_numeric_string
    input = "hello *1.2345* world, *hi*"
    expected = "hello <em>1.2345</em> world, <em>hi</em>"
    renderer = EmRenderer.new
    output = renderer.format(input)
    assert_equal expected, output
  end

end
