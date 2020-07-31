module Processable

  def read_file(input_file)
    filename = File.open(input_file, "r")
    file_content = filename.read
    filename.close
    file_content
  end

  def write_file(output_file, modified_text)
    first_read = File.open(output_file, "r")
    if first_read.read.empty?
      File.open(output_file, "w") do |f|
        f.write "#{modified_text}\n"
      end
    else
      File.open(output_file, "a") do |f|
        f.write "#{modified_text}\n"
      end
    end
    second_read = File.open(output_file, "r")
    puts "Created #{output_file} containing #{second_read.read.length} characters"
    # binding.pry
  end
  
  # def write_file(output_file, modified_text)
  #   first_read = File.open(output_file, "r")
  #   if first_read.read.empty?
  #     File.open(output_file, "w") do |f|
  #       f.write "#{modified_text}\n"
  #     end
  #   else
  #     File.open(output_file, "a") do |f|
  #       f.write "#{modified_text}\n"
  #     end
  #   end
  #   second_read = File.open(output_file, "r")
  #   puts "Created #{output_file} containing #{second_read.read.length} characters"
  #   # binding.pry
  # end

end