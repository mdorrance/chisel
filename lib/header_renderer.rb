class HeaderRenderer
  def initialize
    @count = 0
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
  end
  def format(chunk)
    @count = chunk.count('#')
    chunk.
    "<h#{@count}> #{chunk.delete("#")} </h#{@count}>\n\n"
  end

end