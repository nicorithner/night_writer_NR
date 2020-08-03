 # REQUIRES USER INPUT: ruby test/braille_translator_test.rb "data/message.txt" "data/from_command_line.txt"
  def test_it_can_accept_files_from_the_command_line 
    # skip
    translator = BrailleTranslator.new(ARGV[0], ARGV[1])
    
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", translator.translate_to_braille
  end