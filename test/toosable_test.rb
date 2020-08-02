require "./test/test_helper"

class ToolsableTest < Minitest::Test 

  def test_it_can_read_a_file
    # skip
    test_object = NightWriter.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", test_object.recieve_and_read_file
  end

  def test_helper_method_array_by_40_characters
    # skip
    nightwriter = NightWriter.new("data/eighty_plus.txt", "data/translated.txt")

    assert_equal ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"], nightwriter.array_by_40_characters
  end

  def test_helper_method_characters_in_split_arrays
    # skip
    nightwriter = NightWriter.new("data/hello_braille.txt", "data/braille_to_english.txt")

    assert_equal ["0.", "00", ".."], nightwriter.characters_in_split_arrays[0]
  end
end