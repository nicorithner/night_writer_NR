require "./test/test_helper"

class EnglishTranslatorTest < Minitest::Test 

  def test_it_exists
    translator = EnglishTranslator.new(ARGV[0], ARGV[1])
    assert_instance_of EnglishTranslator, translator
  end

  def test_translates_letter_back_to_english
    # skip
    translator = EnglishTranslator.new("data/one_braille_character.txt", "data/one_letter_h.txt")

    assert_equal "h", translator.translate_to_english
  end

  def test_translates_word_back_to_english
    # skip
    translator = EnglishTranslator.new("data/one_braille.txt", "data/braille_to_english.txt")

    assert_equal "hello", translator.translate_to_english
  end

  def test_translates_a_sentence_back_to_english_from_translated_braille_text
    # skip
    translator = EnglishTranslator.new("data/hello_braille.txt", "data/braille_to_english.txt")

    assert_equal "hello world", translator.translate_to_english
  end  
end