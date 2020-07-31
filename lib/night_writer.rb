require "./lib/file_handler"

class NightWriter
  include FileHandler

  def initialize(message)
    @message = message 
  end

  def translate_to_braille
    @message

    binding.pry
  end

end

FileHandler.read_file(ARGV[0])

