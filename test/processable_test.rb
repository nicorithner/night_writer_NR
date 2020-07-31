require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_it_can_read_a_file
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.recieve_and_read_file
  end

end