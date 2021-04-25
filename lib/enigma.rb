require 'date'
class Enigma
  attr_reader :shifts,
              :original_message

  def initialize
    @shifts = nil
    @original_message = nil
  end

  def add_shifts(shift)
    @shifts = shift
  end

  def key_string
    @shifts.key_used
  end

  def date_string
    @shifts.date_used
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  # def character_location
  #   alphabet.each_with_object({}) {|key, value| value[key] = alphabet.index(key)}
  # end

  def encryption_shifts
    @shifts.final_shifts
  end

  def final_shift_integers
    encryption_shifts.values
  end


end




#   def message_to_array
#     @original_message.split(//)
#   end
#
#   def encrypt_helper1
#     message_to_array
#   end
#
#   def encrypted_string
#     @original_message #string
#     encryption_shifts #hash
#     # alphabet.rotate(SHIFT)[ORIGINAL INDEX]
#   end
#
#   def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
#     @original_message = message
#     encrypted_string =
#     {
#       encryption: encrypted_message,
#       key: key,
#       date: date
#     }
#   end
#
#   def decrypt(message, key, date = Date.today.strftime("%d%m%y").to_i)
#   end
# end
