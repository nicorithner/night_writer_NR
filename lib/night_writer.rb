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

  def output_new_file
    new_file = write_file(@output)
    new_file
  end

end