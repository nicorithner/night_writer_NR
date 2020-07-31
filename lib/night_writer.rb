require "./lib/processable"

class NightWriter
  include Processable

  def initialize(message, output)
    @message = message
    @output = output
  end

  def recieve_and_read_file
    read_file(@message)
  end

  def write_to_file
    write_file_test(@output)
    # write_file(@output)
  end

  def translate
    text = read_file(@message)
    modified = text.gsub(/[" "]/, " modified text ")
    write_file(@output, modified)
  end

  ###### Helper or test method ####
  #==== used in night_write_test: test_it_can_modify_the_input_file
  def read_test_file(file)
    read_file(file)
  end

end