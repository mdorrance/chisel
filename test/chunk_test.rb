require 'minitest/autorun'
require_relative '../lib/chunk'
require_relative '../lib/chunker'

class ChunkTest < Minitest::Test

  def test_renderer_class
    chunker = Chunker.new("Hello\n\nworld\n\n#Mike")
    chunk = Chunk.new(chunker)
    assert true, chunk
  end

  def test_that_there_is_empty_output_for_empty_input

    chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
    chunk = Chunk.new(chunker)

    assert_equal ["Hello", "world", "#Mike"], chunk.chunker
  end

  def test_for_header_#
    chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
    chunk = Chunk.new(chunker)

    assert_equal "#Mike", chunk.header

  end

end
