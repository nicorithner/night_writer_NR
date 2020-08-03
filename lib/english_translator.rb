require "./lib/processable"
require "./lib/toolsable"
require "./lib/alphabet.rb"

class EnglishTranslator
  include Processable # only handles input and output of files
  include Toolsable # helper methods used to process a translation

  def initialize(message, output)
    @message = message
    @output = output
    @dictionary = Alphabet.new
  end

  def translate_to_english
    write_file(@output, string_in_english)
    string_in_english
  end
end