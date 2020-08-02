require "./lib/processable"
require "./lib/toolsable"
require "./lib/alphabet.rb"


class NightWriter
  include Processable
  include Toolsable

  def initialize(message, output)
    @message = message
    @output = output
    @dictionary = Alphabet.new
  end

  def translate_to_braille
    array_by_40_characters
    translated = []
    array_by_40_characters.each do |input|
      [0,2,4].each do |index|
        input.chars.each do |letter|
          if letter == letter.upcase || letter.nil?
            letter = letter.downcase
          end
          translated << encode_letter(letter, index) << encode_letter(letter, index + 1)
        end
        translated << "\n"
      end
    end
    write_file(@output, translated.join)
    translated.join
  end

  def translate_to_english
    write_file(@output, string_in_english)
    string_in_english
  end

end

# nightwriter = NightWriter.new(ARGV[0], ARGV[1])

# nightwriter.translate_to_braille