module ListRenderer
  def format(input)
    opener + list_items_from(input) + closing
  end

  def list_items_from(input)
    items = input.split("\n")

    rendered_items = items.map do |item|
      list_item_from(item)
    end

    rendered_items.join
  end

  def list_item_from(input)
    opener = "  <li>"
    content = input[(input.index(" ") + 1)..-1]
    closer = "</li>\n"

    opener + content + closer
  end
end
