require 'minitest/autorun'
require_relative '../lib/header_renderer'

class HeaderRendererTest < Minitest::Test

  def test_renderer_class
    header_renderer = HeaderRenderer.new
    assert true
  end

  def test_that_there_is_empty_output_for_empty_input
    skip
    header_renderer = HeaderRenderer.new

  end
end
