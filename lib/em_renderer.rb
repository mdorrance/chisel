

class EmRenderer

  def format(chunk)
    chunk.gsub(/\*(\w+)\*/){"<em>#{$1}</em>"}
  end

end
#
# if __FILE__ == $PROGRAM_NAME
#   chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
#   parser = Parser.new(chunker)
#   em = EmRenderer.new(chunk)
# end
