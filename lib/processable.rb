module Processable

  def read_file(input_file)
    filename = File.open(input_file, "r")
    file_content = filename.read
    filename.close
    file_content
  end

  def write_file(output_file)
    file = File.open(output_file, "r")
    
    if file.read.empty?
      File.open(output_file, "w") do |f|
        f.write "#{Time.now} - User logged in\n"
      end
    else
      File.open(output_file, "a") do |f|
        f.write "#{Time.now} - User logged in\n"
      end
    end
  end

end