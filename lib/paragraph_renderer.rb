class ParagraphRenderer

  def format(chunk)
    "<p>\n" +
    "  #{chunk}\n" +
    "</p>\n\n"
  end

end