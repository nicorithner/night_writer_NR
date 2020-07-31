class FileHandler
  attr_reader :file_content
  def initialize(input_file)
    @input_file = input_file
    read_file
  end

  def read_file
    filename = File.open(@input_file, "r")
    @file_content = filename.read
    filename.close
    # binding.pry
  end


end