#The Chunker will take the file and parse it into Chunks of data
#Each Chunk is determined by ending in '\n\n' which will indicate
  #that there is a line break indicating a new Chunk of data

class Chunker

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def chunk
    @input.split("\n\n")
  end

end