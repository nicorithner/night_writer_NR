require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_it_can_read_a_file
    test_object = NightWriter.new("data/message.txt")
    assert_equal "hello world", test_object.translate_to_braille
  end

end