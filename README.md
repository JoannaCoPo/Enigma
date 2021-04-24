# Enigma

alphabet = ("a".."z").to_a << " "

4 shifts: A, B, C, D

# Enigma Class
# Create an Enigma class with the following methods:
#
# Enigma#encrypt(message, key, date)
# The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.

# The encrypt method returns a hash with three keys:
  encrypted = {encryption: "encrypted string",
                         key: "00000",
                        date: "DDMMYY"
                 }
# :encryption => the encrypted String
alphabet = ("a".."z").to_a << " "
ciphertext = alphabet.rotate(shift)[orig_index]

# :key => the key used for encryption as a String
numbers = [0 , 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers.sample(5)
# :date => the date used for encryption as a String in the form DDMMYY
today's day: time.strftime("%d%m%y").to_i
http://strftime.net/

# Enigma#decrypt(ciphertext, key, date)
# The decrypt method takes a ciphertext String and the Key used for encryption as arguments. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.
#
# The decrypt method returns a hash with three keys:
#
# :decryption => the decrypted String
  alphabet.rotate(0)[orig_index]
# :key => the key used for decryption as a String
  (000000)
# :date => the date used for decryption as a String in the form DDMMYY
  (DDMMYY)
_____________________________________
  pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

# encrypt a message with a key and date
pry(main)> enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
pry(main)> enigma.encrypt("hello world")
#=> # encryption hash here
