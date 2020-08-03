require "./lib/processable"
require "./lib/toolsable"
require "./lib/alphabet.rb"

class BrailleTranslator
  include Processable # only handles input and output of files
  include Toolsable # helper methods used to process a translation

  def initialize(message, output)
    @message = message
    @output = output
    @dictionary = Alphabet.new
  end

  def translate_to_braille
    write_file(@output, string_in_braille)
    string_in_braille
  end
end