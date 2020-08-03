require "./test/test_helper"

translator = BrailleTranslator.new(ARGV[0], ARGV[1])
translator.translate_to_braille