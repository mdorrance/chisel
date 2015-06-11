require_relative '../lib/chunker'
require_relative '../lib/parser'

class Chisel

  attr_reader :message_file, :md_num_of_lines, :html_num_of_lines
  attr_accessor :html_file_name

  def initialize(markdown_file, html_file_name)
    @markdown_file = markdown_file
    @html_file_name = html_file_name
  end

  def file_reader
    markdown_file = File.open("./lib/#{@markdown_file}", "r").read
    html_message = Parser.new(Chunker.new(markdown_file).chunk).parse

    @md_num_of_lines = markdown_file.count("\n") + 1
    @html_num_of_lines = html_message.count("\n") + 1

    write_html_file(html_message)
  end

  def write_html_file(html_message)
    File.open("./lib/#{@html_file_name}", "w") do |f|
      f.write(html_message)
    end
  end

end


if __FILE__ == $0
  chisel = Chisel.new(ARGV[0], ARGV[1])
  chisel.file_reader
  puts "Converted #{ARGV[0]} (#{chisel.md_num_of_lines} lines) to  #{ARGV[1]} (#{chisel.html_num_of_lines} lines)"
end