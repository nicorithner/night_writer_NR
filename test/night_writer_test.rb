require "./test/test_helper"

class NightWriterTest < Minitest::Test 

  def test_it_exists
    nightwriter = NightWriter.new
    assert_instance_of NightWriter, nightwriter
  end

end