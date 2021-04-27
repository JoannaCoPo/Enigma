require 'date'
class Enigma
  attr_reader :shifts,
              :encrypted_strings,
              :key_used,
              :date_used

   def initialize
     @shifts = nil
     @encrypted_strings = nil
     @key_used = nil
     @date_used = nil
   end

   def receives_shifts(shift_generator)
     @shifts = shift_generator
   end

   def alphabet
     ("a".."z").to_a << " "
   end

  def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
    key ||= KeyGenerator.new.create_random_number
    @key_used = key
    @date_used = date
    encrypt_strings(message)
    @final_encryption = @encrypted_strings.join
    encryption_info
  end

  def encrypt_strings(message)
    results = []
    message_to_array(message).each_with_index do |letter, index|
      shift = @shifts.values[index % 4]
      original_index = alphabet.find_index(letter)
      new_letter = alphabet[(shift + original_index) % alphabet.length]
      results << new_letter
    end
    @encrypted_strings = results
  end

  def message_to_array(message)
    message.downcase.split(//)
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y").to_i)
    @key_used = key
    @date_used = date
    decrypt_strings(ciphertext)
    decryption_info(ciphertext)
  end

  def decrypt_strings(ciphertext)
    results = []
    message_to_array(ciphertext).each_with_index do |letter, index|
      shift = @shifts.values[index % 4]
      current_index = alphabet.find_index(letter)
      original_letter = alphabet[(current_index - shift) % alphabet.length]
      results << original_letter
    end
    results.join
  end

  def decryption_info(ciphertext)
    {
      decryption: decrypt_strings(ciphertext),
             key: @key_used,
            date: @date_used
    }
  end

  def encryption_info
    {
      encryption: @final_encryption,
             key: @key_used,
            date: @date_used
    }
  end
end
