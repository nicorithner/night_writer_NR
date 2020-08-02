require "./lib/processable"

class NightWriter
  include Processable

  def initialize(message, output)
    @message = message
    @output = output
    @dictionary = Alphabet.new
  end
  
  def translate_to_braille
    input = recieve_and_read_file
    translated = []
    [0,2,4].each do |index|
      input.chars.each do |letter|
        if letter == letter.upcase || letter.nil?
          letter = letter.downcase
        end
        translated << find_and_convert_character(letter, index) << find_and_convert_character(letter, index + 1)
      end
      translated << "\n"
    end
    write_file(@output, translated.join)
    translated.join
  end
  
  def translate_to_english
    text = recieve_and_read_file
    line_by_line = text.split("\n")
    row_one = []
    row_two = []
    row_three = []
    
    row_one = line_by_line[0].scan(/../)
    row_two = line_by_line[1].scan(/../)
    row_three = line_by_line[2].scan(/../)
    
    characters_in_split_arrays = row_one.zip(row_two, row_three)
    assembled_characters = characters_in_split_arrays.map {|array| array.join}
    
    in_english = [ ]
    braille_characters_array = assembled_characters
    
    braille_characters_array.each do |character|
      in_english << @dictionary.english_braille[character]
    end
    write_file(@output, in_english.join)
    in_english.join
  end

  ####################### End of Currently working on
  #####=============== HELPER METHODS
  
  ##==== Used in translate_to_braille_method. Converts to charted array and returns element in the braille-converted array by index provided.
  def find_and_convert_character(character, index)
    @dictionary.braille_alphabet[character].chars[index]
  end
  
  #####=============== TEST METHODS 

  #==== used in night_write_test: test_it_can_modify_the_input_file
  def read_test_file(file)
    read_file(file)
  end

  #==== used in processabel_test to test_it_can_read_a_file
  def recieve_and_read_file
    read_file(@message)
  end

  #==== night_writer_test: test_it_can_modify_the_input_file & processable_test: test_it_can_write_to_a_file
  def translate
    text = read_file(@message)
    modified = text.gsub(/[" "]/, " modified text ")
    write_file(@output, modified)
  end
end