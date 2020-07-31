require "./test/test_helper"

class FileHandlerTest < Minitest::Test 

  def test_it_exists
    file_handler = FileHandler.new
    assert_instance_of FileHandler, file_handler
  end

end