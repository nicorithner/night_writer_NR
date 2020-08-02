module Processable

  def read_file(input_file)
    filename = File.open(input_file, "r")
    file_content = filename.read
    filename.close
    file_content
  end

  def write_file(output_file, modified_text)
    first_read = File.new(output_file, "w")
    File.open(output_file, "w") { |f| f.write "#{modified_text}".chomp }
    second_read = File.open(output_file, "r")
    puts "Created #{output_file} containing #{second_read.read.length} characters"
  end

end