require "./test/test_helper"

class ProcessableTest < Minitest::Test 

  def test_read_a_file
    # skip
    translator = EnglishTranslator.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", translator.read_file("data/message.txt")
  end

  def test_it_can_read_a_file
    # skip
    translator = EnglishTranslator.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", translator.recieve_and_read_file
  end

  def test_it_can_write_to_a_file
    # skip
    translator = EnglishTranslator.new("data/message.txt", "data/processable_can_write.txt")
    translator.can_modify
    assert_equal "hello modified text world", translator.read_test_file("data/processable_can_write.txt")
  end

end