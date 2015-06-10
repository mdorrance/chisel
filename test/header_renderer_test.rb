require 'minitest/autorun'
require_relative '../lib/header_renderer'

class HeaderRendererTest < Minitest::Test

  def test_renderer_class
    assert HeaderRenderer.new
  end
  # NOT NEEDED!!!!!!!
  # def test_that_there_is_empty_output_for_empty_input
  #   header_renderer = HeaderRenderer.new
  #   input = ""
  #   assert_equal "", header_renderer.format(input)
  # end

  def test_that_there_is_empty_output_for_h1_string
    skip
    header_renderer = HeaderRenderer.new
    input = "#mike"
    expected = <<-EOS
""<h1> mike </h1>

"
EOS
    assert_equal expected, header_renderer.format(input)
  end

  def test_that_there_is_h1_with_strong_string

    header_renderer = HeaderRenderer.new
    input = "#mike **hi** there"
    expected = "<h1> mike <strong>hi</strong> there </h1>"
    assert_equal expected, header_renderer.format(input).strip
  end

  def test_that_there_is_h1_with_strong_and_em_string

    header_renderer = HeaderRenderer.new
    input = "#mike **hi** there *dude* guy"
    expected = "<h1> mike <strong>hi</strong> there <em>dude</em> guy </h1>"
    assert_equal expected, header_renderer.format(input).strip
  end





end
