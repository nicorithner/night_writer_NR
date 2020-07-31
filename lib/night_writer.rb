require "./lib/processable"

class NightWriter
  include Processable

  def initialize(message)
    @message = message
  end

  def translate_to_braille
    output = read_file(@message)
binding.pry
  end

end