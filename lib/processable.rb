module Processable

  def read_file(input_file)
    filename = File.open(input_file, "r")
    file_content = filename.read
    filename.close
    file_content
  end

  def write_file(output_file)
    filename = File.open(output_file, "w")
    filename.write(NightWriter.new(file_content).translate_to_braille)
    filename.close
  end

end