require_relative 'em_renderer'
require_relative 'strong_renderer'
require_relative 'links_renderer'

class HeaderRenderer

  def initialize
    @count = 0
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
    @link_renderer = LinksRenderer.new
    @parse = ""
    @parse2 = ""
  end

  def format(chunk)
    @count = chunk.count('#')
    @parse = @strong_renderer.format(chunk)
    @parse2 = @em_renderer.format(@parse)
    if @parse2.include? "["
      final = @link_renderer.format(@parse2)
    else
      final = @parse2
    end
    "<h#{@count}> #{final.delete("#")} </h#{@count}>\n\n"
  end

end