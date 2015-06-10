require './lib/list_renderer'

class UnorderedListRenderer
  include ListRenderer

  def opener
    "<ul>\n"
  end

  def closing
    "</ul>"
  end
end