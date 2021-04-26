require 'date'
require_relative 'shiftable'
class Enigma
  include Shiftable
  attr_reader :shifts,
              :original_message,
              :encrypted_strings,
              :final_encryption,
              :key_used,
              :date_used,
              :backward_shift

   def initialize
     @shifts = nil
     @original_message = nil
     @encrypted_strings = nil
     @final_encryption = nil
     @key_used = nil
     @date_used = nil
     @backward_shift = nil
   end

   # def add_shifts(shift)
   #   @shifts = shift
   # end

   # def add_message(message)
   #   @original_message = message.message_to_encrypt
   # end

   # def key_string
   #   @shifts.key_used
   # end
   #
   # def date_string
   #   @shifts.date_used
   # end

   def alphabet
     ("a".."z").to_a << " "
   end

   def encryption_shifts
     # @shifts.final_shifts
     @shifts
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
    if key && date != nil
      @key_used = key
      @date_used = date
      @shifts = generate_shifts_from_args(key, date)
    else
      encrypt_without_key_date
    end
    encryption_feedback
  end

  def encryption_info
    {
      encryption: @final_encryption,
             key: @key_used,
            date: @date_used
    }

  end

  def encrypt_without_key_date
    @shifts = generate_shifts
    @key_used = random_key_used
    @date_used = todays_date
  end

  def encryption_feedback
    encrypt_strings
    @final_encryption = join_strings
    encryption_info
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y").to_i)
    if date != nil
      @backward_shift = generate_shifts_from_args(key, date)
    # else
    #   @backward_shift = decrypt_shifts_from_args(key, Date.today.strftime("%d%m%y").to_i)
    end
    decryption_feedback
  end

  def encrypted_message_to_array
    @final_encryption.split(//)
  end

  def decryption_feedback
    decrypt_strings
    decryption_info
  end

  def decryption_info
    {
      decryption: decrypt_strings,
             key: @key_used,
            date: @date_used
    }
  end

  def decrypt_strings
    results = []
    encrypted_message_to_array.each_with_index do |letter, index|
      shift = encryption_shifts.values[index % 4]
      current_index = alphabet.find_index(letter)
      original_letter = alphabet[(current_index - shift) % alphabet.length]
      results << original_letter
    end
    results.join
  end

end
