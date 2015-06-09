class ParagraphRenderer

  def initialize
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
    @parse = ""
  end

  def format(chunk)
    @parse = @strong_renderer.format(chunk)
    final = @em_renderer.format(@parse)
    "<p>\n" +
    "  #{final}\n" +
    "</p>\n\n"
  end

end