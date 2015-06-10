require 'minitest/autorun'
require './lib/chunk_identifier'

class ChunkIdentifierTest < Minitest::Test
  def test_it_exists
    assert ChunkIdentifier
  end

  def test_it_identifies_a_paragraph
    identifier = ChunkIdentifier.new
    assert_equal :paragraph, identifier.identify("hello")
  end

  def test_it_identifies_a_header
    identifier = ChunkIdentifier.new
    assert_equal :header, identifier.identify("# hello")
  end

  def test_it_identifies_an_ordered_list
    identifier = ChunkIdentifier.new
    assert_equal :ordered_list, identifier.identify("1. hello")
  end

  def test_it_identifies_an_unordered_list
    identifier = ChunkIdentifier.new
    assert_equal :unordered_list, identifier.identify("* hello")
  end

  def test_it_identifies_a_paragraph_that_starts_with_emphasis
    identifier = ChunkIdentifier.new
    assert_equal :paragraph, identifier.identify("*hello* friend")
  end
end
