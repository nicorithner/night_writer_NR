require "./test/test_helper"

class FileHandlerTest < Minitest::Test 

  def test_it_exists
    file_handler = FileHandler.new "data/message.txt"
    assert_instance_of FileHandler, file_handler
  end

  def test_it_can_read_a_file
    file_handler = FileHandler.new "data/message.txt"
    assert_equal "hello world", file_handler.file_content
  end

end