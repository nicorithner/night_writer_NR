require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_it_can_read_a_file
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.recieve_and_read_file
  end

  def test_it_can_write_to_a_file
    skip
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    test_object.translate
    assert_equal "hello modified text world\n", test_object.read_test_file("data/translated.txt")
  end

end