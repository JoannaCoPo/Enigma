class Message
  attr_reader :unencrypted_message

  def initialize(string)
    @unencrypted_message = string
  end
end

#such thing as too "small" of a class (does too little)?
