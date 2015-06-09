class StrikethroughRenderer

  def format(input)
    input.gsub(/\~\~(\w+)\~\~/){"<del>#{$1}</del>"}
  end

end