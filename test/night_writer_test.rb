require "./test/test_helper"

class NightWriterTest < Minitest::Test 

  def test_it_exists
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")

    assert_instance_of NightWriter, nightwriter
  end
  
  def test_it_can_modify_the_input_file
    skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    
    nightwriter.translate

    assert_equal "hello modified text world\n", nightwriter.read_test_file("data/translated.txt")
    nightwriter.translate
    assert_equal "hello modified text world\nhello modified text world\n", nightwriter.read_test_file("data/translated.txt")
  end

  def test_it_can_write_a_new_file_using_given_output_file_name
    skip
    nightwriter = NightWriter.new("data/message.txt", "data/custom_name.txt")
    nightwriter1 = NightWriter.new("data/message.txt", "data/translated.txt")
    
    nightwriter.translate
    nightwriter1.translate

    assert_equal true, File.exists?("data/custom_name.txt")
    assert_equal true, File.exists?("data/translated.txt")
  end

  def test_can_lookup_a_letter_and_create_an_charted_array
    skip
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")
    
    assert_equal ["0", ".", ".", ".", ".", "."], nightwriter.find_and_convert_character("a", 0..-1)
  end

  def test_can_translate_a_lower_case_letter
    skip
    nightwriter = NightWriter.new("data/message.txt", "data/one_letter.txt")
    
    assert_equal "0.\n..\n..\n", nightwriter.translate_to_braille("a")
  end

  def test_translates_message
    nightwriter = NightWriter.new("data/message.txt", "data/braille.txt")

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n", nightwriter.translate_to_braille("hello world")
  end
  
end