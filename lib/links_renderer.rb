class LinksRenderer

  def initialize
    @pre_link = ""
    @md_link = ""
  end

  def pre_link(chunk)
    if chunk.index('[') > 0
      close = chunk.index('[')
      @pre_link = chunk[(0)..(close-1)]
    else
      @prelink
    end
  end

  def md_link(chunk)
    open = chunk.index('[')
    close = chunk.index(')')

    return "" unless open && close

    chunk[(open)..(close)]
  end

  def link(chunk)
    open = chunk.index('[')
    close = chunk.index(']')
    chunk[(open+1)..(close-1)]
  end

  def post_link(chunk)
    open = chunk.index(')')
    chunk[(open+1)..(-1)]
  end

  def url(chunk)
    open = chunk.index('(')
    close = chunk.rindex('/')
    chunk[(open+1)..(close)]
  end

  def title(chunk)
    open = chunk.rindex('/')
    close = chunk.index(')')

    title = chunk[(open+1)..(close-1)]

    if title.include? "\""
      title
    else
      title = " \"\""
    end
  end

  def format(chunk)
    until (link_chunk = md_link(chunk)).empty?
      chunk = "#{pre_link(chunk)}<a href=\"#{url(link_chunk)}\" title=#{title(link_chunk)}> #{link(link_chunk)}</a>#{post_link(chunk)}"
    end

    chunk
  end

end