#The Chunks are the individual pieces of data and will then be
  #broken down into the specific html element type

require_relative 'chunker'
require_relative 'header_renderer'
require_relative 'paragraph_renderer'

class Parser

  attr_reader :chunker

  def initialize(chunker)
    @chunker = chunker
    @header_renderer = HeaderRenderer.new
    @paragraph_renderer = ParagraphRenderer.new
  end

  def parse
    @chunker.map do |chunk|
      if chunk.start_with?("#")
        puts @header_renderer.format(chunk)
      else
        puts @paragraph_renderer.format(chunk)
      end
    end
  end

end

chunker = Chunker.new("Hello\n\nworld\n\n###Mike").chunk
parser = Parser.new(chunker)
puts parser.parse
