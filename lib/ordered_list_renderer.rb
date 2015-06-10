require './lib/list_renderer'

class OrderedListRenderer
  include ListRenderer

  def opener
    "<ol>\n"
  end

  def closing
    "</ol>\n\n"
  end
end
