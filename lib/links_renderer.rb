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
    @bracket_pairs = 0
    @parens_pairs = 0
    @title = ""
    @url = ""
    @link = ""
    @pre_link = ""
    @post_link = ""
  end

  def pre_link(chunk)
    if chunk.index('[') > 0
      close = chunk.index('[')
      @pre_link = chunk[(0)..(close-1)]
    else
      @prelink
    end
  end

  def link(chunk)
    open = chunk.index('[')
    close = chunk.index(']')
    @link = chunk[(open+1)..(close-1)]
  end

  def post_link(chunk)
    open = chunk.index(')')
    @post_link = chunk[(open+1)..(-1)]
  end

  def url(chunk)
    open = chunk.index('(')
    close = chunk.rindex('/')
    @url = chunk[(open+1)..(close)]
  end

  def title(chunk)
    open = chunk.rindex('/')
    close = chunk.index(')')

    @title = chunk[(open+1)..(close-1)]

    if @title.include? "\""
      @title
    else
      @title = " \"\""
    end
  end

  def format(chunk)
    "#{pre_link(chunk)}<a href=\"#{url(chunk)}\" title=#{title(chunk)}> #{link(chunk)}</a>#{post_link(chunk)}"
  end

end