require 'minitest/autorun'
require_relative '../lib/renderer'

class RendererTest < Minitest::Test

  def test_renderer_class
    renderer = Renderer.new
    assert true
  end

  def test_that_there_is_empty_output_for_empty_input
    renderer = Renderer

  end
end
