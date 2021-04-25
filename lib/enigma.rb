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

  def encryption_shifts
    @shifts.final_shifts
  end

  # make work with all args, then make
  # work witout date then without date
  def encrypt(message, key = nil, date = Date.today.strftime("%d%m%y").to_i)
    @original_message = message
    encrypted_string

    {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def encrypted_string
    @original_message #string
    encryption_shifts #hash
    alphabet.rotate(SHIFT)[ORIGINAL INDEX]
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def character_locations
    locations = Hash.new
    # locations.transform_keys.with_index do |letter, ord|
    locations.each_key do |key|
      alphabet.find do |letter|
        key.index == letter.index
        key = letter
      end
    end
  end
  # a = ("a".."z").to_a << " "
  #
  # def shift_a
  #   3
  # end
  #
  # def shift_b
  #   27
  # end
  #
  # def shift_c
  #   73
  # end
  #
  # def shift_d
  #   20
  # end
  #
  # p a.rotate(0)[4]








  def decrypt(message, key, date = Date.today.strftime("%d%m%y").to_i)

  end



end
