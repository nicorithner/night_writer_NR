require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_it_can_read_a_file
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.recieve_and_read_file
  end

  def test_it_can_write_to_a_file
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    test_object.write_to_file
    # assert_equal "not sure how to test yet", test_object.output_new_file
  end

end