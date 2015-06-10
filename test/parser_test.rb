require 'minitest/autorun'
require_relative '../lib/parser'
require_relative '../lib/chunker'

class ParserTest < Minitest::Test

  def test_renderer_class
    chunker = Chunker.new("Hello\n\nworld\n\n#Mike")
    parser = Parser.new(chunker)

    assert true, parser
  end

  def test_that_there_is_empty_output_for_empty_input
    chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
    parser = Parser.new(chunker)

    assert_equal ["Hello", "world", "#Mike"], parser.chunker
  end

  def test_return_strings_of_html
    chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
    parser = Parser.new(chunker)
    output = "<p>\n  Hello\n</p>\n\n" "<p>\n  world\n</p>\n\n" "<h1> Mike </h1>\n\n"

    assert_equal output, parser.parse
  end

end
