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

  def encryption_shifts
    @shifts.final_shifts
  end

  def message_to_array(string)
    @original_message.split(//)
  end
#TRY MOUDLO
#alphabet[(shift + original_index) % alphabet.length]
  def encrypt_string
    results = []
    message_to_array.each_with_index do |letter, index|
      shift = encryption_shifts.values[ index % 4]
      original_index = alphabet.find_index(letter)
      new_letter = alphabet[(shift + original_index) % alphabet.length]
      results << new_letter
    end
    results
  end

end
