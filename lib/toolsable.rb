module Toolsable

  #####=============== HELPER METHODS
  
  ##==== Used in translate_to_braille_method. Converts to charted array and returns element in the braille-converted array by index provided.
  def encode_letter(character, index)
    @dictionary.braille_alphabet[character].chars[index]
  end
  
  #==== Used in in translate_to_braille and translate_to_english. Used in processable_test to test_it_can_read_a_file
  def recieve_and_read_file
    read_file(@message)
  end

  #==== Used in in translate_to_braille to limit the amount of characters to 40 per "line"
  def array_by_40_characters 
    recieve_and_read_file.scan(/.{1,40}/)
  end

  #==== Used in in string_in_english method to translate_to_english. Organizes the lines of braille into character arrays.
  def characters_in_split_arrays
    array_of_lines = recieve_and_read_file.split("\n")
    row_one = []
    row_two = []
    row_three = []
    row_one = array_of_lines[0].scan(/../)
    row_two = array_of_lines[1].scan(/../)
    row_three = array_of_lines[2].scan(/../) 
    characters_in_split_arrays = row_one.zip(row_two, row_three)
  end
  
  #==== Used in in translate_to_english
  def string_in_english
    characters_in_split_arrays
    assembled_characters = characters_in_split_arrays.map {|array| array.join}
    in_english = [ ]
    assembled_characters.each do |character|
      in_english << @dictionary.english_braille[character]
    end
    in_english.join
  end

  #####=============== TEST METHODS 

  #==== used in night_write_test: test_it_can_modify_the_input_file
  def read_test_file(file)
    read_file(file)
  end

  #==== night_writer_test: test_it_can_modify_the_input_file & processable_test: test_it_can_write_to_a_file
  def translate
    text = read_file(@message)
    modified = text.gsub(/[ ]/, " modified text ")
    write_file(@output, modified)
  end

end