require "./test/test_helper"

class NightWriterTest < Minitest::Test 

  def test_it_exists
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")

    assert_instance_of NightWriter, nightwriter
  end
  
  def test_it_can_modify_the_input_file
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    nightwriter.can_modify

    assert_equal "hello modified text world", nightwriter.read_test_file("data/translated.txt")
  end

  def test_it_can_write_a_new_file_using_given_output_file_name
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/custom_name.txt")
    nightwriter1 = NightWriter.new("data/message.txt", "data/translated.txt")
    nightwriter.can_modify
    nightwriter1.can_modify

    assert_equal true, File.exist?("data/custom_name.txt")
    assert_equal true, File.exist?("data/translated.txt")
  end

  def test_can_lookup_a_letter_and_create_an_charted_array
    # skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")

    assert_equal ["0", ".", ".", ".", ".", "."], nightwriter.encode_letter("a", 0..-1)
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
    # skip
    nightwriter = NightWriter.new("data/hello_braille.txt", "data/braille_to_english.txt")

    assert_equal "hello world", nightwriter.translate_to_english
  end

  

end