require 'date'
class Enigma
  attr_reader :original_message

  def initialize
    @original_message = nil
  end

  def receive_message(message)
    @original_message = message.unencrypted_message #is this ok (LOD)
  end

end
