require 'minitest/autorun'
require './lib/links_renderer'

class LinksRendererTest < Minitest::Test

  def test_existence
    assert LinksRenderer
  end

end