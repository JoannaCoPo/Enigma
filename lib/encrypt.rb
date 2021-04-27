# #!/usr/bin/env ruby
# require 'date'
# require_relative 'enigma'
# require_relative 'message'
# require_relative 'shift_generator'
# require_relative 'key_generator'
# require_relative 'offset_generator'
#
# ARGV == ["message_prac.txt", "encrypted.txt"]
# ARGV[0] == "message_prac.txt"
# ARGV[1] == "encrypted.txt"

file = File.open(ARGV[0], "r")

message = file.read

file.close

puts message
