require "./lib/processable"
require "./lib/toolsable"
require "./lib/alphabet.rb"


class NightWriter
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

# require "./lib/alphabet.rb"
# require "pry"
# nightwriter = NightWriter.new(ARGV[0], ARGV[1])

# nightwriter.translate_to_braille
# nightwriter.translate_to_english