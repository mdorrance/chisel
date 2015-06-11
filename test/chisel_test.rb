require 'minitest/autorun'
require_relative '../lib/chisel'

class ChiselTest < Minitest::Test

  def test_for_html_file
    File.open("./lib/test-md-file.markdown", "w") do |f|
      f.write("hello world")
    end

    chisel = Chisel.new("test-md-file.markdown", "test-html-file.html")

    chisel.file_reader

    assert_equal "<p>\n  hello world\n</p>\n\n", File.read("./lib/test-html-file.html")
  end

end