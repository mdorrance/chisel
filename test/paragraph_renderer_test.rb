require 'minitest/autorun'
require_relative '../lib/paragraph_renderer'

class ParagraphRendererTest < Minitest::Test

  def test_renderer_class
    paragraph_renderer = ParagraphRenderer.new
    assert true
  end

  def test_that_there_is_empty_output_for_empty_input
    skip
    paragragh_renderer = ParagraphRenderer.new

  end
end
