require 'minitest/autorun'
require_relative '../lib/renderer'

class RendererTest < Minitest::Test

  def test_renderer_class
    assert Renderer
  end

  def test_that_there_is_empty_output_for_empty_input
    skip
    renderer = Renderer.new

  end
end
