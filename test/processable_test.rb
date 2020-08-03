require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_read_a_file
    # skip
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.read_file("data/message.txt")
  end

  def test_it_can_read_a_file
    # skip
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.recieve_and_read_file
  end

  def test_it_can_write_to_a_file
    # skip
    test_object = NightWriter.new("data/message.txt", "data/processable_can_write.txt")
    test_object.can_modify
    assert_equal "hello modified text world", test_object.read_test_file("data/translated.txt")
  end

end