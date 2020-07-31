require "./test/test_helper"

class NightWriterTest < Minitest::Test 

  def test_it_exists
    nightwriter = NightWriter.new("data/message.txt", "data/translated.txt")

    assert_instance_of NightWriter, nightwriter
  end
  
  def test_it_can_modify_the_input_file
    nightwriter = NightWriter.new("data/message.txt", "data/modified_text.txt")
    
    assert_equal "hello modified text", nightwriter.translate("data/message.txt")
  end
end