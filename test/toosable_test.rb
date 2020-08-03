require "./test/test_helper"

class ToolsableTest < Minitest::Test 

  def test_can_lookup_a_letter_and_create_an_charted_array
    # skip
    translator = BrailleTranslator.new("data/message.txt", "data/translated.txt")
    
    assert_equal ["0", ".", ".", ".", ".", "."], translator.encode_letter("a", 0..-1)
  end

  def test_it_can_read_a_file
    # skip
    translator = EnglishTranslator.new("data/message.txt", "data/translated.txt")
    assert_equal "hello world", translator.recieve_and_read_file
  end

  def test_helper_method_array_by_40_characters
    # skip
    translator = BrailleTranslator.new("data/eighty_plus.txt", "data/translated.txt")

    assert_equal ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"], translator.array_by_40_characters
  end

  def test_helper_method_characters_in_split_arrays
    # skip
    translator = BrailleTranslator.new("data/hello_braille.txt", "data/braille_to_english.txt")

    assert_equal ["0.", "00", ".."], translator.characters_in_split_arrays[0]
  end

  def test_assembled_characters_puts_braille_character_together
    # skip
    translator = BrailleTranslator.new("data/one_word_braille.txt", "data/one_word.txt")
    
    assert_equal ["0..00.", "00.00.", "0..0.."], translator.assembled_characters
  end

  def test_string_in_english
    # skip
    translator = EnglishTranslator.new("data/hello_braille.txt", "data/braille_to_english.txt")
    assert_equal "hello world", translator.string_in_english
  end

  def test_read_test_file_can_read_a_give_file
    # skip
    translator = BrailleTranslator.new("data/can_read.txt", "data/translated.txt")

    assert_equal "I can read this", translator.read_test_file("data/can_read.txt")
  end

  def test_helper_can_modify_changes_the_input_file
    # skip
    translator = BrailleTranslator.new("data/message.txt", "data/translated.txt")
    translator.can_modify

    assert_equal "hello modified text world", translator.read_test_file("data/translated.txt")
  end

  def test_string_in_braille_translates_text_to_braille
    # skip
    translator = BrailleTranslator.new("data/message.txt", "data/braille.txt")

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", translator.string_in_braille
  end
end