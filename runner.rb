require "./lib/night_writer.rb"
require "./lib/alphabet.rb"
require "pry"

nightwriter = NightWriter.new(ARGV[0], ARGV[1])
# binding.pry
nightwriter.translate_to_braille