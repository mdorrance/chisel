require 'minitest/autorun'
require_relative '../lib/chunker'

class ChunkerTest < Minitest::Test

  def test_renderer_class
    chunker = Chunker.new("hello")
    assert true
  end

  def test_that_there_is_empty_output_for_empty_input
    chunker = Chunker.new("")
    assert_equal "", chunker.input
  end

  def test_that_input_returns_string
    chunker = Chunker.new("Hello")

    assert_equal "Hello", chunker.input
  end

  def test_return_two_chunks
    chunker = Chunker.new("Hello\n\nworld")

    assert_equal ["Hello", "world"], chunker.chunk
  end

  def test_return_3_chunks_with_#
    chunker = Chunker.new("Hello

world\n\n#Mike")

    assert_equal ["Hello", "world", "#Mike"], chunker.chunk
  end
end

