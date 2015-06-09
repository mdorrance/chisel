require 'minitest/autorun'
require_relative '../lib/strong_renderer'

class StrongRendererTest < Minitest::Test

  def test_renderer_class
    strong = StrongRenderer.new
    assert true
  end

end
