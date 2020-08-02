require "./test/test_helper"

class NightWriterTest < Minitest::Test 

  def test_it_exists
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")

    assert_instance_of NightWriter, nightwriter
  end
  
  def test_it_can_modify_the_input_file
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    
    nightwriter.translate

    assert_equal "hello modified text world", nightwriter.read_test_file("data/translated.txt")
  end

  def test_it_can_write_a_new_file_using_given_output_file_name
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/custom_name.txt")
    nightwriter1 = NightWriter.new("data/message.txt", "data/translated.txt")
    
    nightwriter.translate
    nightwriter1.translate

    assert_equal true, File.exists?("data/custom_name.txt")
    assert_equal true, File.exists?("data/translated.txt")
  end

  def test_can_lookup_a_letter_and_create_an_charted_array
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    
    assert_equal ["0", ".", ".", ".", ".", "."], nightwriter.find_and_convert_character("a", 0..-1)
  end

  def test_can_translate_a_lower_case_letter
    # skip
    nightwriter = NightWriter.new("data/one_letter_a.txt", "data/braille.txt")
    
    assert_equal "0.\n..\n..\n", nightwriter.translate_to_braille
  end

  def test_translates_message
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/braille.txt")

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n", nightwriter.translate_to_braille
  end
  
  def test_translates_letter_back_to_english
    # skip
    nightwriter = NightWriter.new("data/one_braille_character.txt", "data/one_letter_h.txt")

    assert_equal "h", nightwriter.translate_to_english
  end

  def test_translates_word_back_to_english
    # skip
    nightwriter = NightWriter.new("data/one_braille.txt", "data/braille_to_english.txt")

    assert_equal "hello", nightwriter.translate_to_english
  end

  def test_translates_a_sentence_back_to_english_from_translated_braille_text
    skip
    nightwriter = NightWriter.new("data/hello_braille.txt", "data/braille_to_english.txt")

    assert_equal "hello world", nightwriter.translate_to_english
  end

  def test_moves_to_new_lines_when_braille_translation_over_80_spaces
    skip
    nightwriter = NightWriter.new("data/eighty_plus.txt", "data/eighty_plus_braille.txt")

    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n..\n"
    
    assert_equal expected, nightwriter.translate_to_braille
  end

  def test_it_can_accept_files_from_the_command_line
    skip
    nightwriter = NightWriter.new(ARGV[0], ARGV[1])

    nightwriter.translate_to_braille
    
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", nightwriter.read_test_file("data/from_command_line.txt")
  end
end
