class ChunkIdentifier

  def identify(input)
    if input.start_with?("#")
      :header
    elsif input.start_with?("1. ")
      :ordered_list
    elsif input.start_with?("* ")
      :unordered_list
    elsif input.start_with?("[")
      :links
    else
      :paragraph
    end

  end
end