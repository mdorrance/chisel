require './lib/em_renderer'
require './lib/strong_renderer'

module ListRenderer

  def initialize
    @em_renderer = EmRenderer.new
    @strong_renderer = StrongRenderer.new
    @parse = ""
  end

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
    @parse = @strong_renderer.format(input)
    final = @em_renderer.format(@parse)
    content = final[(final.index(" ") + 1)..-1]
    closer = "</li>\n"

    opener + content + closer
  end
end
