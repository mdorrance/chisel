require_relative 'em_renderer'
require_relative 'strong_renderer'

class HeaderRenderer

  def initialize
    @count = 0
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
    @parse = ""
  end

  def format(chunk)
    @count = chunk.count('#')
    @parse = @strong_renderer.format(chunk)
    final = @em_renderer.format(@parse)
    "<h#{@count}> #{final.delete("#")} </h#{@count}>\n\n"
  end

end