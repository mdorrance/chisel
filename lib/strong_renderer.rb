class StrongRenderer

  def format(chunk)
    pairs = chunk.count('**') / 2
    until pairs == 0
      chunk = chunk.sub('**', '<strong>')
      chunk = chunk.sub('**', '</strong>')
      pairs -= 1
    end

    chunk
  end

end

