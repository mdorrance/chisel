require './lib/list_renderer'

class OrderedListRenderer
  include ListRenderer

  def opener
    "<ol>\n"
  end

  def closing
    "</ol>"
  end
end

# class UnorderedListRenderer
#   include ListRenderer
#
#   def opener
#     "<ul>\n"
#   end
#
#   def closing
#     "</ul>"
#   end
# end