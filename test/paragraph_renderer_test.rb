require 'minitest/autorun'
require_relative '../lib/paragraph_renderer'

class ParagraphRendererTest < Minitest::Test

  attr_reader :renderer

  def setup
    @renderer = ParagraphRenderer.new
  end

  def assert_formatted(expected, input)
    assert_equal expected, renderer.format(input).strip
  end

  def test_that_there_is_output_for_p_string
    input = "mike"
    expected = "<p>\n  mike\n</p>"
    assert_formatted(expected, input)
  end

  def test_that_there_is_p_with_strong_string
    input = "mike <strong>hi</strong> there"
    expected = "<p>\n  mike <strong>hi</strong> there\n</p>"
    assert_formatted(expected, input)
  end

  def test_that_there_is_p_with_strong_and_em_string
    input = "mike <strong>hi</strong> there <em>dude</em> guy"
    expected = "<p>\n  mike <strong>hi</strong> there <em>dude</em> guy\n</p>"
    assert_formatted(expected, input)
  end

end
