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

ciphertext = incoming_text.chomp
encrypt = @enigma.decrypt(ciphertext, "02715", "040895")
encryption = encrypt.values[0]
puts "Created '#{ARGV[1]}' with the key '#{ARGV[2]}' and date '#{ARGV[3]}'"

writer  = File.open(ARGV[1], "w")
writer.write(encryption)
writer.close
