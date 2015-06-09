require 'minitest/autorun'
require_relative '../lib/em_renderer'

class EmRendererTest < Minitest::Test

  def test_renderer_class
    em = EmRenderer.new
    assert true
  end

end
