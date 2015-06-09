

class EmRenderer

  def format(chunk)
    pairs = chunk.count('*') / 2
    until pairs == 0
      chunk = chunk.sub('*', '<em>')
      chunk = chunk.sub('*', '</em>')
      pairs -= 1
    end

    return chunk
    # chunk.gsub(/\*(\w+)\*/){"<em>#{$1}</em>"}
  end

end
#
# if __FILE__ == $PROGRAM_NAME
#   chunker = Chunker.new("Hello\n\nworld\n\n#Mike").chunk
#   parser = Parser.new(chunker)
#   em = EmRenderer.new(chunk)
# end
