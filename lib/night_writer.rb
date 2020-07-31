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
    write_file(@output)
  end

  def translate
    text = read_file(@message)
    modified = text.gsub(/[" "]/, " modified text ")
  end

end