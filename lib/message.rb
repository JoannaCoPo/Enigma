class Message
  attr_reader :message_to_encrypt

  def initialize(message_string)
    @message_to_encrypt = message_string
  end
end
