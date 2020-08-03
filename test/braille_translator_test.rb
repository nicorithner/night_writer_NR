require "./test/test_helper"

class BrailleTranslatorTest < Minitest::Test 

  def test_it_exists
    translator = BrailleTranslator.new(ARGV[0], ARGV[1])
    assert_instance_of BrailleTranslator, translator
  end

  def test_it_has_attributes
    translator = BrailleTranslator.new("data/message.txt", "data/translated.txt")

    assert_equal "data/message.txt", translator.message
    assert_equal "data/translated.txt", translator.output
  end

end