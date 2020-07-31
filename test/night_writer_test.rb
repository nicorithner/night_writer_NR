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
    nightwriter = NightWriter.new("data/message.txt", "data/custom_name.txt")
    nightwriter1 = NightWriter.new("data/message.txt", "data/translated.txt")
    nightwriter.translate
    nightwriter1.translate
    assert_equal true, File.exists?("data/custom_name.txt")
    assert_equal true, File.exists?("data/translated.txt")
  end
  
end