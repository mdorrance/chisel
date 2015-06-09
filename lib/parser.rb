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
        @header_renderer.format(chunk)
      else
        @paragraph_renderer.format(chunk)
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  chunker = Chunker.new("**Hello** mike\n\n*the*world\n\n###Mike").chunk
  parser = Parser.new(chunker)
  puts parser.parse
end

