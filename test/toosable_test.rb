require "./test/test_helper"

class ToolsableTest < Minitest::Test 

  def test_can_lookup_a_letter_and_create_an_charted_array
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    
    assert_equal ["0", ".", ".", ".", ".", "."], nightwriter.encode_letter("a", 0..-1)
  end

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

  def test_assembled_characters_puts_braille_character_together
    # skip
    nightwriter = NightWriter.new("data/one_word_braille.txt", "data/one_word.txt")
    
    assert_equal ["0..00.", "00.00.", "0..0.."], nightwriter.assembled_characters
  end

  def test_string_in_english
    # skip
    nightwriter = NightWriter.new("data/hello_braille.txt", "data/braille_to_english.txt")
    assert_equal "hello world", nightwriter.string_in_english
  end

  def test_read_test_file_can_read_a_give_file
    # skip
    nightwriter = NightWriter.new("data/can_read.txt", "data/translated.txt")

    assert_equal "I can read this", nightwriter.read_test_file("data/can_read.txt")
  end

  def test_helper_can_modify_changes_the_input_file
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    nightwriter.can_modify

    assert_equal "hello modified text world", nightwriter.read_test_file("data/translated.txt")
  end

  def test_string_in_braille_translates_text_to_braille
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/braille.txt")

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", nightwriter.string_in_braille
  end
end