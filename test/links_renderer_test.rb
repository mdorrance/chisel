require 'minitest/autorun'
require './lib/links_renderer'

class LinksRendererTest < Minitest::Test

  attr_reader :renderer

  def setup
    @renderer = LinksRenderer.new
  end

  def test_existence
    assert LinksRenderer
  end

  def test_it_finds_a_pair_of_brackets
    input = "[mistake](testing)"
    expected = "mistake"
    output = renderer.link(input)
    assert_equal expected, output
  end

  def test_it_finds_url
    input = "[mistake](http://example.com/ \"Title\")"
    expected = "http://example.com/"
    output = renderer.url(input)
    assert_equal expected, output
  end

  def test_it_finds_title
    input = "[mistake](http://example.com/ \"Title\")"
    expected = " \"Title\""
    output = renderer.title(input)
    assert_equal expected, output
  end

  def test_it_formats_html
    input = "[an example](http://example.com/ \"Title\")"
    expected = "<a href=\"http://example.com/\" title= \"Title\"> an example</a>"
    output = renderer.format(input)
    assert_equal expected, output
  end

  def test_it_formats_html_with_no_title
    input = "[an example](http://example.com/)"
    expected = "<a href=\"http://example.com/\" title= \"\"> an example</a>"
    output = renderer.format(input)
    assert_equal expected, output
  end

end