class EmRenderer

  def format(chunk)
    pairs = chunk.count('*') / 2
    until pairs == 0
      chunk = chunk.sub('*', '<em>')
      chunk = chunk.sub('*', '</em>')
      pairs -= 1
    end

    chunk
  end

end

