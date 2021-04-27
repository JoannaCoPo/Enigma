# #!/usr/bin/env ruby
require 'date'
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
encryption = @enigma.encrypt(message, "02715", "040895")

# require "pry"; binding.pry
puts "Created '#{encryption.values[0]}' with the key '#{encryption.values[1]}' and date '#{encryption.values[2]}'"

writer  = File.open(ARGV[1], "w")

writer.write(encryption)

writer.close
