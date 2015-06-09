class StrongRenderer

  def format(chunk)
    chunk.gsub(/\*\*(\w+)\*\*/){"<strong>#{$1}</strong>"}
  end

end