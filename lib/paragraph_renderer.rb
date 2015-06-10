require './lib/em_renderer'
require './lib/strong_renderer'
require './lib/links_renderer'

class ParagraphRenderer

  def initialize
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
    @link_renderer = LinksRenderer.new
    @parse = ""
    @parse2 = ""
  end

  def format(chunk)
    @parse = @strong_renderer.format(chunk)
    @parse2 = @em_renderer.format(@parse)
    if @parse2.include? "["
      final = @link_renderer.format(@parse2)
    else
      final = @parse2
    end

    "<p>\n" +
    "  #{final}\n" +
    "</p>\n\n"
  end

end