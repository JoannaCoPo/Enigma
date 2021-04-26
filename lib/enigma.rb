require 'date'
class Enigma
  attr_reader :shifts,
              :original_message,
              :encrypted_strings

   def initialize
     @shifts = nil
     @original_message = nil
     @encrypted_strings = nil
   end

   def add_shifts(shift)
     @shifts = shift
   end

   # def add_message(message)
   #   @original_message = message.message_to_encrypt
   # end

   def key_string
     @shifts.key_used
   end

   def date_string
     @shifts.date_used
   end

   def alphabet
     ("a".."z").to_a << " "
   end

   def encryption_shifts
     @shifts.final_shifts
   end

   def message_to_array
     @original_message.downcase.split(//)
   end

#alphabet[(shift + original_index) % alphabet.length]

  def encrypt_strings
    results = []
    message_to_array.each_with_index do |letter, index|
      shift = encryption_shifts.values[index % 4]
      original_index = alphabet.find_index(letter)
      new_letter = alphabet[(shift + original_index) % alphabet.length]
      results << new_letter
    end
    @encrypted_strings = results
  end

  def join_strings
    @encrypted_strings.join
  end

  def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
    @original_message = message
    if key == nil

    encrypt_strings
    join_strings
  end

  def generate_key

  def encryp_feedback
    {
      encryption: join_strings,
             key: key_string,
            date: date_string
    }

  end
end
