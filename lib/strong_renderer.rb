class StrongRenderer

  def format(chunk)

    pairs = chunk.count('**') / 2
    until pairs == 0
      chunk = chunk.sub('**', '<strong>')
      chunk = chunk.sub('**', '</strong>')
      pairs -= 1
    end

    return chunk
    # chunk.gsub(/\*\*(\w+)\*\*/){"<strong>#{$1}</strong>"}
  end

end