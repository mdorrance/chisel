class HeaderRenderer
  def initialize
    @count = 0
  end
  def format(chunk)
    @count = chunk.count('#')
    "<h#{@count}> #{chunk.delete("#")} </h#{@count}>\n\n"
  end

end