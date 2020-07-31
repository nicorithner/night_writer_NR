module Processable

def self.read_file(input_file)
    filename = File.open(input_file, "r")
    file_content = filename.read
    puts file_content
    filename.close
  end



end