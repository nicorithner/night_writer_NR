require "./test/test_helper"

class BrailleTranslatorTest < Minitest::Test 

  def test_it_exists
    translator = BrailleTranslator.new(ARGV[0], ARGV[1])
    assert_instance_of BrailleTranslator, translator
  end

  def test_can_translate_a_lower_case_letter
    # skip
    translator = BrailleTranslator.new("data/one_letter_a.txt", "data/braille.txt")
    
    assert_equal "0.\n..\n..", translator.translate_to_braille
  end

  def test_translates_message
    # skip
    translator = BrailleTranslator.new("data/message.txt", "data/braille.txt")

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", translator.translate_to_braille
  end

  def test_moves_to_new_lines_when_braille_translation_over_80_spaces
    # skip
    translator = BrailleTranslator.new("data/eighty_plus.txt", "data/eighty_plus_braille.txt")

    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n.."
    
    assert_equal expected, translator.translate_to_braille
  end
end