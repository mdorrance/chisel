class LinksRenderer
  #
  # This is [an example](http://example.com/ "Title") inline link.
  # [This link](http://example.net/) has no title attribute.
  #<p>This is <a href="http://example.com/" title="Title">
  # an example</a> inline link.</p>
  # <p><a href="http://example.net/">This link</a> has no
  # title attribute.</p>
  #Need to identify when there are a pair of []next to ()

  #find the brackets and strip that into a variable then find the
  #parens content and strip it into a variable

  def initialize
    @pre_link = ""
    @md_link = ""
  end

  # md = something [text](url) else [text](url) whatever
  # split = md.split('[') #=> [something , text](url) else , text](url) whatever]
  # first = split.shift
  # split.each do |remainder|
  #   # text](url) else
  #   split2 = remainder.split(']') #=> [text, (url) else ]
  #   text = split2.first
  #
  # end

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

  def format_one_link
    if @md_link.empty?
      @chunk
    else
      @chunk = "#{pre_link(chunk)}<a href=\"#{url(chunk)}\" title=#{title(chunk)}> #{link(chunk)}</a>#{post_link(chunk)}"
    end
  end

  def format(chunk)
    until (link_chunk = md_link(chunk)).empty?
      chunk = "#{pre_link(chunk)}<a href=\"#{url(link_chunk)}\" title=#{title(link_chunk)}> #{link(link_chunk)}</a>#{post_link(chunk)}"
    end

    chunk
  end

end