require 'minitest/autorun'
require_relative '../lib/paragraph_renderer'

class ParagraphRendererTest < Minitest::Test

  def test_renderer_class
    assert ParagraphRenderer

  end
  #
  # def test_that_there_is_empty_output_for_empty_input
  #   skip
  #   paragragh_renderer = ParagraphRenderer.new
  #
  # end

  def test_that_there_is_empty_output_for_p_string
    header_renderer = ParagraphRenderer.new
    input = "mike"
    expected = <<-EOS
"<p>
  mike
</p>

    EOS
    assert_equal expected, header_renderer.format(input)
  end

  def test_that_there_is_p_with_strong_string

    header_renderer = ParagraphRenderer.new
    input = "mike **hi** there"
    expected = "<p> mike <strong>hi</strong> there </p>"
    assert_equal expected, header_renderer.format(input)
  end

  def test_that_there_is_p_with_strong_and_em_string
    header_renderer = ParagraphRenderer.new
    input = "mike **hi** there *dude* guy"
    expected = "<p> mike <strong>hi</strong> there <em>dude</em> guy </p>"
    assert_equal expected, header_renderer.format(input)
  end

end
