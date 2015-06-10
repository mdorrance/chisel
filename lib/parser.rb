#The Chunks are the individual pieces of data and will then be
  #broken down into the specific html element type

require_relative 'chunker'
require_relative 'header_renderer'
require_relative 'paragraph_renderer'
require './lib/chunk_identifier'

class Parser

  attr_reader :chunker, :header_renderer, :paragraph_renderer, :identifier

  def initialize(chunker)
    @chunker = chunker
    @header_renderer = HeaderRenderer.new
    @paragraph_renderer = ParagraphRenderer.new
    @ordered_list_renderer = OrderedListRenderer.new
    @identifier = ChunkIdentifier.new
  end

  def parse
    @chunker.map do |chunk|
      chunk_type = identifier.identify(chunk)

      case chunk_type
        when :paragraph then paragraph_renderer.format(chunk)
        when :header    then header_renderer.format(chunk)
        when :ordered_list then ordered_list_renderer.format(chunk)
        #when :unordered_list then unordered_list_renderer(chunk)
      end

      # if chunk.start_with?("#")
      #   @header_renderer.format(chunk)
      # else
      #   @paragraph_renderer.format(chunk)
      # end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  chunker = Chunker.new("**Hello** mike\n\n*the*world\n\n###Mike").chunk
  parser = Parser.new(chunker)
  puts parser.parse
end

