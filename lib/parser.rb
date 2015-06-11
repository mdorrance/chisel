#The Chunks are the individual pieces of data and will then be
  #broken down into the specific html element type

require_relative 'chunker'
require_relative 'header_renderer'
require_relative 'paragraph_renderer'
require './lib/chunk_identifier'
require_relative 'ordered_list_renderer'
require_relative 'unordered_list_renderer'

class Parser

  attr_reader :chunker,
              :header_renderer,
              :paragraph_renderer,
              :unordered_list_renderer,
              :ordered_list_renderer,
              :identifier,
              :links

  def initialize(chunker)
    @chunker = chunker
    @header_renderer = HeaderRenderer.new
    @paragraph_renderer = ParagraphRenderer.new
    @ordered_list_renderer = OrderedListRenderer.new
    @unordered_list_renderer = UnorderedListRenderer.new
    @links_renderer = LinksRenderer.new
    @identifier = ChunkIdentifier.new
  end

  def parse
    @chunker.map do |chunk|
      chunk_type = identifier.identify(chunk)

      case chunk_type
        when :paragraph then paragraph_renderer.format(chunk)
        when :header    then header_renderer.format(chunk)
        when :ordered_list then ordered_list_renderer.format(chunk)
        when :unordered_list then unordered_list_renderer.format(chunk)
        when :links then links_renderer.format(chunk)
      end

      # if chunk.start_with?("#")
      #   @header_renderer.format(chunk)
      # else
      #   @paragraph_renderer.format(chunk)
      # end
    end.join
  end

end



