require_relative 'enigma'
require_relative 'message'
require_relative 'shift_generator'
require_relative 'key_generator'
require_relative 'offset_generator'
require_relative 'set_up'

file = File.open(ARGV[0], "r")
incoming_text = file.read
file.close

message1 = Message.new(incoming_text)
message = message1.message_to_encrypt.chomp
encrypt = @enigma.encrypt(message, "02715", "040895")
encryption = encrypt.values[0]
puts "Created '#{ARGV[1]}' with the key '#{encrypt.values[1]}' and date '#{encrypt.values[2]}'"

writer  = File.open(ARGV[1], "w")
writer.write(encryption)
writer.close
