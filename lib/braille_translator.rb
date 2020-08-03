class BrailleTranslator
  attr_reader :message, :output
  def initialize(message, output)
    @message = message
    @output = output
  end

end