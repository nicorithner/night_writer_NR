module Toolsable

  #####=============== HELPER METHODS
  
  ##==== Used in translate_to_braille_method. Converts to charted array and returns element in the braille-converted array by index provided.
  def encode_letter(character, index)
    @dictionary.braille_alphabet[character].chars[index]
  end
  
  #==== Used in in array_by_40_characters. Used in processable_test to test_it_can_read_a_file
  def recieve_and_read_file
    read_file(@message)
  end

  #==== Used in in translate_to_braille to limit the amount of characters to 40 per "line"
  def array_by_40_characters 
    recieve_and_read_file.scan(/.{1,40}/)
  end

  #==== Used in in assembled_characters. Organizes the lines of braille into character arrays.
  def characters_in_split_arrays
    array_of_lines = recieve_and_read_file.split("\n")
    row_one = array_of_lines[0].scan(/../).to_a
    row_two = array_of_lines[1].scan(/../).to_a
    row_three = array_of_lines[2].scan(/../).to_a
    row_one.zip(row_two, row_three)
  end

  #====Used in string_in_english. Puts together braille characters so they can be translated.
  def assembled_characters
    characters_in_split_arrays.map {|array| array.join}
  end
  
  #==== Used in in translate_to_english
  def string_in_english
    assembled_characters.map {|character| @dictionary.english_braille[character]}.join
  end

  def string_in_braille
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
    translated.join.chomp
  end

  #####=============== TEST METHODS 

  #==== used in night_write_test: test_it_can_modify_the_input_file
  def read_test_file(file)
    read_file(file)
  end

  #==== night_writer_test: test_it_can_modify_the_input_file & processable_test: test_it_can_write_to_a_file
  def can_modify
    write_file( @output, read_file(@message).gsub(/[ ]/, " modified text ") )
  end

end 