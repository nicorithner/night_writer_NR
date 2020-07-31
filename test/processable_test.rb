require "./test/test_helper"

class ProcessableTest < Minitest::Test 
  def setup
    @test_object = Object.new "data/message.txt"
    @test_object.extend(Processable)

    class << @test_object
      

  end



  def test_it_exists
    
  end

  # def test_it_can_read_a_file
  #   file_handler = FileHandler.new "data/message.txt"
  #   assert_equal "hello world", file_handler.file_content
  # end

end